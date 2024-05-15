# 9. UDS Package Definition with Maturity Levels

Date: 2023-07-17

## Status

Accepted

Supercedes [4. UDS Package Definition](0004-uds-package-definition.md)

## Context

## Context

 Our organization has established a standard for what it means to be a UDS package. A UDS package is a package that is
 hosted on "our" registry and supported by Product, with an unspoken requirement that it is secure and reliable.
 However, there are additional characteristics that define what it means to be a UDS package.

## Decision

A UDS package must meet the following characteristics:

1. It must be a Zarf package.
1. It must be reusable by multiple customer environments.
1. It must be comprised of one or more UDS capabilities.
1. It must be supported by a minimum of two maintainers.
1. It must state what secure and reliable means in its documentation.
1. It must be hosted on the Defense Unicorns Registry.
1. It must be maintained by the UDS Product team to be considered UDS core or a UDS capability.
1. It must best tested in CI on top of other UDS packages when possible.  e.g. DUBBD should be tested on top of UDS IaC
1. It must have a healthy installation process that is tested in CI.
1. It must support upgrade success from the previous released version.
1. It must support rollback to a previous stable version in the event of an upgrade failure.
1. It must have and pass end-to-end tests.
1. It must be integrated with other UDS packages where possible. For example, UDS packages should be integrated with the
   monitoring stack inside of the Big Bang UDS, and Prometheus should be scraping and displaying metrics.
1. It must have explicit mapping, in OSCAL, for controls the package provides to applications running on top.

A UDS capability is a tool selected to perform a specific function. UDS capabilities' are assessed a specific level of
maturity using the following definitions:

1. Initial deployment - demonstrable capability. Successfully installed using mostly manual steps and configuration
1. Repeatable deployment - automated capability deployment. Zarf package creation and deployment workflows are complete
1. Integrated capability - all required DUBBD interfaces complete. Istio ingress, mutual TLS, policies, accounts, etc.
1. Managed capability - preconfigured out-of-the-box (think GitLab CI)
1. General availability / fully supported capability - automated upgrades, patching, backup, and restore functionality
    fully available to downstream consumers

By establishing these characteristics for a UDS package, we can ensure that all UDS packages meet a consistent standard
of quality and reliability. This will help us maintain the security and stability of our environment and reduce the risk
of issues arising from package installation, upgrades, or downgrades. Additionally, by requiring integration with other
UDS packages and explicit mapping in OSCAL, we can ensure that all UDS packages work together seamlessly and provide the
necessary controls for applications running on top.

## Consequences

 The main consequence of this decision is that it may require additional resources and effort to ensure that UDS
 packages meet these characteristics. However, this is a necessary trade-off to maintain the security and stability of
 environments using UDS and ensure that all UDS packages work together seamlessly. Additionally, this decision will
 improve the overall quality and reliability of our UDS packages.

Overall, this decision establishes a clear standard for what it means to be a UDS package and ensures that all UDS
packages meet a consistent level of quality and reliability.
