# 1. Record architecture decisions

Date: 2024-06-03

## Status

Accepted

## Context

Big Bang as a baseline has its own strengths and weaknesses but as we grow and modularize our applications it has not shown itself to be very scalable to our needs.

## Decision

We will migrate existing deployments off of DUBBD and will deprecate all previous UDS capabilities.  New packages will be maintained starting with the following new repos:

- [uds-core](https://github.com/defenseunicorns/uds-core) Replacement for the core of the Big Bang umbrella (i.e. Istio, Prometheus, etc)
- [uds-software-factory](https://github.com/defenseunicorns/uds-software-factory/) Replacement for the previous software factory and collab capabilities
- [uds-common](https://github.com/defenseunicorns/uds-common) Common toolkit for centralizing patterns for building out UDS packages.

## Consequences

We will need to staff teams and take on the maintenance burden for these new capabilities but we believe that the added control we will gain will make our deployments more flexible, and leaner to meet our needs.

Previous ADRs have been moved into the "deprecated" folder and should only be referenced for historical purposes if looking back on what UDS capabilities were.
