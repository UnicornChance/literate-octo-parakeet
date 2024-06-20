# 8. Cluster Autoscaler

Date: 2023-07-11

## Status

Accepted

## Context

UDS needs a way to scale nodes in a Kubernetes cluster for DUBBD-AWS.  The requirements for this ADR are:

- Running on AWS
- Quick to respond to scaling events

## Assessment of Alternatives

### Kubernetes Cluster Autoscaler

[Cluster Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler) is a tool developed by
Kubernetes.  It will adjust the size of the cluster when:

- There are pods that failed to run in the cluster due to insufficient resources.
- There are nodes in the cluster that have been underutilized for an extended period of time and their pods can be placed
on other existing nodes.

It supports many cloud providers including AWS, Azure, and GCP.  For AWS, it uses EC2 Auto Scaling Groups to manage the
nodes.  Cluster Autoscaler adjusts the desired value while respecting the minimum and maximum values of the Auto Scaling
Group.  Since Cluster Autoscaler uses Auto Scaling groups, the the EC2 instance types used for the nodes would be
dependent on the Auto Scaling Group(s) configuration.

#### Pros

- Supported by Kubernetes
- Supports many cloud providers
- Best used in clusters running workloads that tend to be static and consistent

#### Cons

- Inflexible instance types due to dependence on Auto Scaling Groups

### Karpenter

[Karpenter](https://karpenter.sh) is an auto scaling tool developed by AWS.  Karpenter will add and remove nodes based
on pod requirements.  Rather than using EC2 Auto Scaling Groups and node groups, Karpenter directly manages EC2 instances
to add to the cluster.  However, Karpenter itself will run in a node group and manage nodes outside of the node group.
Karpenter will choose an EC2 instance type based on the requirements of the pod and constraints of the Provisioner (the
custom resource that scales the cluster up and down).  Since Karpenter manages these nodes outside of a node group or
Autscaling Group, these instances will likely fall out of scope of the rest of your infrastructure.  This means
CloudFormation or Terraform will not be able to clean up these instances.  Though Karpenter is designed to handle any
cloud provider, it is currently only supported for EKS on AWS.

#### Pros

- Flexible instance types
- Best used for clusters with workloads that encounter periods of high, spiky demand or have diverse compute requirements

#### Cons

- Only EKS on AWS is officially supported
- Unclear how well this would work on other clouds or another K8s distribution on AWS
- Cannot run Karpenter on a node managed by Karpenter

## Decision

It was difficult to capture performance data while testing Cluster Autoscaler and Karpenter.  Both solutions would
quickly create a new EC2 instance in response to pending pods.  The response time was less than a minute and possible
around 30 seconds.  Again, these times were difficult to capture.  I observed the expected instance type behavior from
both solutions--Cluster Autoscaler sticking with the instance type of the Auto Scaling Group and Karpenter choosing
different instance types within constraints.

Though we could get performance and cost benefits from using Karpenter, its official support is limited to AWS.  Our
team has decided to outweigh future-proofing our designs over Karpenter's scaling flexibility by going with Kubernetes's
Cluster Autoscaler.  We do not expect spiky, diversie compute requirements for our workloads, but we do expect to need
to support other platforms like RKE2 and VMware.  It is currently unknown how Karpenter would be able to support other
platforms if at all.  On the other hand, Cluster Autoscaler will support other cloud platforms in addition to AWS, RKE2
using Autoscaling Groups, and even [VMware for on-prem
clusters](https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid/1.6/vmware-tanzu-kubernetes-grid-16/GUID-cluster-lifecycle-scale-cluster.html#:~:text=Cluster%20Autoscaler%20is%20a%20Kubernetes,Cluster%20Autoscaler%20introduction%20and%20documentation.).

## Consequences

By going with Cluster Autoscaler, we will be prepared to support different computer platforms in the future.  However,
we wil need to manage node groups and different AWS Auto Scaling Groups if we ever need to address a requirement for
different compute types and workloads.
