# 3. DUBBD Istio Ingress Gateway Architecture

Date: 2023-04-13

## Status

Draft

## Context

One of the components of the Defense Unicorns Big Bang Distribution (DUBBD) is the Istio Service Mesh. [Ingress
Gateways](https://istio.io/latest/docs/concepts/traffic-management/#gateways) are a means of Istio traffic management
that can expose an in-cluster service for inbound traffic.

In order to reduce cognitive load for operators, DUBBD should be configured out of the box to support an architecture
that meets security controls (for example: [this one in NIST
800-53](https://csrc.nist.gov/projects/cprt/catalog#/cprt/framework/version/SP_800_53_5_1_0/home?element=SC-2:~:text=Prevent%20the%20presentation%20of%20system%20management%20functionality%20at%20interfaces%20to%20non%2Dprivileged%20users))
without over being overly complex.

The two proposed Istio architecture options are:

1. A single Ingress Gateway
2. Two Ingress Gateways (separate ones for "Administrative" / "Management" traffic and a different one for all other
   traffic)

## Decision

The change that we're proposing or have agreed to implement.

## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
