# 4. Software Factory Repository Structure And Versioning

Date: 2023-07-06

## Status

Accepted

## Context

The Software Factory (SWF) will consist of three unique offerings at the start of the project and will be versioned
using semver.

1. **uds-swf-base** - The unopinionated flavor of the SWF with regards to how the user plans to store their data.
This version of the SWF will assume there are already databases/object stores/etc in place where it expects them. This
flavor of the SWF is seen as the base/main and will be what the other flavors are based off of.

2. **uds-swf-onprem** - This flavor of the SWF is intended to be used in an all-in-one self contained package. Upon
deployment it would spin up all required dependencies locally and not depend on any external services.

3. **uds-swf-aws** - This flavor of the SWF will come packaged with IaC to set up all required dependencies in AWS.
This flavor is specific to AWS.

## Repository Structure

### Single Repository

- A single repository with all of the flavors of the SWF in it. Each flavor would be its own top level directory and
the zarf.yaml for each flavor would be in its folder.

### Multiple Repositories

- Each flavor of the SWF would have its own separate git repository. The zarf.yaml would be in the top level of the
repository instead of in its own directory.

## Versioning Scheme

### Unified Versioning

- All flavors of the software factory share the same version number and are released concurrently.
  - Current:
    |Flavor          |Version |
    |----------------|--------|
    |uds-swf-base:   |4.2.5   |
    |uds-swf-onprem: |4.2.5   |
    |uds-swf-aws:    |4.2.5   |
  - Update of anything:
    |Flavor          |Version      |
    |----------------|-------------|
    |uds-swf-base:   |***4.2.6***  |
    |uds-swf-onprem: |***4.2.6***  |
    |uds-swf-aws:    |***4.2.6***  |

### Divergent Versioning

- Every flavor of the software factory has its own version that does not depend on any other flavor.
  - Current:
    |Flavor          |Version |
    |----------------|--------|
    |uds-swf-base:   |1.3.2   |
    |uds-swf-onprem: |2.1.0   |
    |uds-swf-aws:    |2.2.3   |

  - Update of onprem:
    |Flavor          |Version     |
    |----------------|------------|
    |uds-swf-base:   |1.3.2       |
    |uds-swf-onprem: |***2.1.1*** |
    |uds-swf-aws:    |2.2.3       |
  - Update of aws:
    |Flavor          |Version     |
    |----------------|------------|
    |uds-swf-base:   |1.3.2       |
    |uds-swf-onprem: |2.1.0       |
    |uds-swf-aws:    |***2.2.4*** |

### Inherited Versioning

- The uds-swf-base flavor is given a top level version (i.e. 1.3.2). All other flavors of the SWF that inherit from
it append their own metadata to that version (aws example 1.3.2-aws.2). The upstream version is pinned to the version
of the base being imported and the metadata version is bumped whenever there is an independent change. Upon updating
the upstream import the metadata version resets to 0.
  - Current:
    |Flavor          |Version         |
    |----------------|----------------|
    |uds-swf-base:   | 1.3.2          |
    |uds-swf-onprem: | 1.3.2-onprem.3 |
    |uds-swf-aws:    | 1.3.2-aws.1    |
  - Update of base:
    |Flavor          |Version              |
    |----------------|---------------------|
    |uds-swf-base:   |***1.3.3***          |
    |uds-swf-onprem: |***1.3.3-onprem.0*** |
    |uds-swf-aws:    |***1.3.3-aws.0***    |
  - Update of onprem:
    |Flavor          |Version              |
    |----------------|---------------------|
    |uds-swf-base:   |1.3.2                |
    |uds-swf-onprem: |1.3.2-***onprem.4*** |
    |uds-swf-aws:    |1.3.2-aws.1          |
  - Update of aws:
    |Flavor          |Version           |
    |----------------|------------------|
    |uds-swf-base:   |1.3.2             |
    |uds-swf-onprem: |1.3.2-onprem.3    |
    |uds-swf-aws:    |1.3.2-***aws.2*** |

## Decision

We will adopt:

- Repository Structure: Multiple Repositories
- Versioning Scheme: Inherited Versioning

## Consequences

### Pros

- Separate repos allows for tagging of each flavor
- Allows for each push to main to cut a new version eliminating the need for a release schedule
- Prevents the possibility of a no-change release

### Cons

- More overhead maintaining multiple repositories and their versions
- No "one stop shop" for end users to look at for all flavors of the swf (Could be solved with another repo that
imports swf flavors as submodules)
