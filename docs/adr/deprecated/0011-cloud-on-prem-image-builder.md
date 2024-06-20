# 11. Cloud/On-Prem Image Builder

Date: 2023-10-06

## Status

Accepted

## Context

In the context of deploying our software on both cloud and on-premises systems, it is essential to have a secure operating system environment that includes all necessary dependencies for airgap cluster creation. While some environments offer pre-hardened VM images for specific operating systems, these often come with associated costs and do not fully meet our unique requirements for airgapped cluster creation. We require a versatile tool that can create images suitable for various environments.

The available tools in this domain can be categorized into three main groups:
- **DIY Options**: This typically involves a process where a virtual machine (VM) is created, and an image is saved from the provisioned VM. Solutions in this category may use tools like Terraform or Pulumi to aid in VM provisioning and image creation. For example, see [Pulumi's AMI](https://www.pulumi.com/registry/packages/aws/api-docs/ec2/ami/) resource.
- **Cloud Provider-Specific Image Builders**: Cloud providers such as AWS ([AWS EC2 Image Builder](https://aws.amazon.com/image-builder/)) and Azure ([Azure VM Image Builder](https://learn.microsoft.com/en-us/azure/virtual-machines/image-builder-overview)) offer straightforward methods to create images with a user-friendly process. However, these solutions are tailored to specific cloud providers.
- **Environment-Agnostic Builder**: [Packer](https://www.packer.io/) stands out as the only tool that provides image building capabilities for a wide range of environments, including various clouds, on-premises hypervisors, and bare metal, all through a streamlined process.

## Decision

After careful consideration, we have decided to adopt Packer as our image builder for all environments, encompassing clouds, on-premises hypervisors, and bare metal. Packer offers the most elegant solution, eliminating the need for multiple processes to cater to different environments. While there are alternatives that involve using specific cloud builders and exporting to other environments, this approach would complicate local building options and necessitate additional product-maintained tooling for handling these exports.

## Consequences

This decision does warrant a deeper examination of our intended usage and its implications, particularly concerning Packer's licensing under the [Business Source License (BSL)](https://github.com/hashicorp/packer/blob/main/LICENSE), which introduces its own set of associated risks.
