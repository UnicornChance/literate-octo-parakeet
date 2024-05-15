# 1. Standardize Naming Conventions Across UDS

Date: 2023-06-02

## Status

Accepted

## Context

Standardization of naming conventions across UDS products, packages, and capabilities is necessary for searchability,
understanding, consistency and cohesion between groups working to support and consume UDS.

## Decision

Repositories should be named for the product or product capability they implement. How they are implemented should not
be a part of the repository name.

**Patterns for naming:**

    Terraform Module Pattern/s:

        * terraform-<provider>-uds-<name>
        * terraform-<provider>-uds-<name or "-" delimited name identifier>

    Examples:

        * terraform-aws-uds-state-bucket
        * terraform-aws-uds-rds
        * terraform-aws-uds-eks-nodegroup
        * terraform-azure-uds-aks-nodegroup

**UDS Package Patterns:**

***Note:*** if multiple packages are produced for different platforms from the same repo, name the packaged artifact
with the provider but omit the provider from the repo name

    UDS Package Pattern/s:

        * uds-package-<name> (this one is provider agnostic)
        * uds-package-<name>-<provider>
        * uds-package-<name or "-" delimited name/identifier>-<provider>

    Examples:

        Provider Agnostic Repo:

        * uds-package-dubbd

        Provider-specific artifacts produced in the generic repo:

        * uds-package-dubbd-aws
        * uds-package-dubbd-azure
        * uds-package-dubbd-rke2
        * uds-package-dubbd-k3d

    Supporting Package/Repo Pattern:

        * uds-<applies to>-<name or "-" delimited name/identifier>

        Examples: 

        * uds-common-workflows
        * uds-common-documentation-site

**Why:**

    Having a consistent naming pattern aids developer discoverability. Avoiding referencing the tools used to implement 
    the capability means that if we change the implementation, then the repository name still makes sense.

    However, in some cases (e.g. terraform) a certain naming convention is prescribed and as such we are limiting 
    ourselves and potentially creating tech debt not to follow it. In that case, we will follow the spirit of how we 
    approach naming conventions while still falling inside the standard.

    See reference: <https://developer.hashicorp.com/terraform/registry/modules/publish#requirements>**

## Consequences

It will be easier to create, consume, test, and interoperate components of UDS with a consistent naming convention.
