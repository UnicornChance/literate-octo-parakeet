# 8. DUBBD Services Ingress Configuration

Date: 2023-06-23

## Status

Draft

## Context

One of the NIST 800-53 controls requires "Separate user functionality, including user interface services, from system management functionality" (more details available [here](https://csrc.nist.gov/Projects/risk-management/sp800-53-controls/release-search#/control?version=5.1&number=SC-2)).

As part of DUBBD, various Big Bang components are deployed that are configured to be exposed outside of the deployed Kubernetes cluster through the use of an Istio Ingress Gateway.

These components include:

* Grafana
* Kiali
* Neuvector
* Tempo

The options for Istio Ingress Gateways include:

* Tenant
* Admin

Any individual that requires access to the Big Bang components to perform their job function would be classified as needing "privileged" rights. As opposed to other individuals who may have access to the end-user exposed application running on top of the DUBBD deployed Kubernetes cluster. When deploying additional services to a cluster with DUBBD, this criteria would be used to determine the appropriate ingress placement.

## Decision

All the "out of the box" components deployed via DUBBD are configured to be accesible via the `Admin` Ingress Gateway.

## Consequences

This decision satisfies the control to separate user functionality from system management functionality.  It also impacts networking, as DNS for each Big Bang component hostnames must resolve to the `Admin` Ingress Gateway Load Balancer IP.
