# 13. Supported Operating System

Date: 2023-10-18

## Status

Accepted

This ADR supersedes previous decisions related to the supported operating system in [ADR 7: UDS On-Prem IaC and Kubernetes Solution](0007-uds-on-prem-iac-and-kubernetes-solution.md).

## Context

Product and delivery currently deploy UDS capabilities and bundles across a variety of operating systems. To create a standardized baseline, this ADR evaluates available options and selects the product-supported operating systems. Product will develop a reusable builder pattern to harden the chosen operating systems for usage across both cloud and on-premises environments. The hardened images will be used by product for testing and internal environments and recommended to delivery efforts.

We are considering the following criteria in our selection of the operating systems:
1. Availability of Security Technical Implementation Guides (STIGs) and STIG automation tools from the Defense Information Systems Agency (DISA).
2. FIPS (Federal Information Processing Standards) validated modules.
3. Compatibility with our chosen Kubernetes distribution, RKE2.
4. Desires from our mission heroes (existing preferences for a specific OS).
5. Open-source nature and cost considerations.
6. Government and enterprise market adoption.

Upon evaluating the first three criteria, there are four viable operating systems: Ubuntu Pro 20.04, Red Hat Enterprise Linux (RHEL) 8, SUSE Linux Enterprise Server (SLES) 15, and Oracle Linux 8. Among these, only Ubuntu Pro and RHEL are known to be in use or desired by our mission heroes. Although both of these operating systems require a paid license, there is currently no entirely free and open-source operating system that provides FIPS support.

## Decision

Considering the sufficiency of both Ubuntu and RHEL for our needs, product will move forward supporting both RHEL 8 and Ubuntu Pro 20.04 hardened image builds. While both operating systems will be maintained and hardened equally, product will initially target RHEL 8 for internal dogfooding and UDS testing efforts due to its broader adoption across government organizations. Product will recommend adoption of one of these two OSes for all delivery efforts, whether in cloud environments or on-premises.

## Consequences

By selecting licensed operating systems, we acknowledge that there will be associated costs for development, staging, and production environments. While licensing in the cloud is typically straightforward, this decision may introduce new challenges related to license management for local developers and airgapped environments.

Some mission heroes may already be committed to alternative operating systems, or they may harbor reservations about these choices, often due to concerns related to licensing costs or prior poor experiences. Ensuring support for these missions will place more responsibility on the delivery team as they will need to handle constructing and maintaining a secure operating system tailored to their specific mission requirements.

While this decision makes the most sense given the current landscape of options and mission hero requirements, there is a possibility that the operating system and mission hero landscapes may shift in the future. Supporting both Ubuntu and RHEL does position us well for shifts to other Fedora or Debian based operating systems but there may be more work required to shift to other distributions.
