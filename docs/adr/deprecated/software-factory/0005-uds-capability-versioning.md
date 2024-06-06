# 5. Versioning of UDS Capabilities

Date: 2023-07-10

## Status

Accepted

## Context

BigBang's packages (helm charts) are versioned inline with the upstream's chart version and have "-bb.x"
appended to it. This ADR is meant to clarify the versioning scheme we will use for capabilities,
especially, but not limited to, cases where we use bigbang packages.

### Inherited versioning

We take a helm chart versioned by Bigbang and adopt it's version and add on to the semver prerelease
field.

- Example:
    |Helm Chart Name          |Version            |
    |-------------------------|-------------------|
    |Upstream Gitlab          |7.0.4              |
    |BigBang's Gitlab         |7.0.4-bb.0         |
    |uds-capability-gitlab    |7.0.4-bb.0-uds.1   |

### Standalone versioning

We ignore the version of the upstream helm chart and decide on when to increment versions ourselves.

- Example:
    |Helm Chart Name          |Version    |
    |-------------------------|-----------|
    |Upstream Gitlab          |7.0.4      |
    |BigBang's Gitlab         |7.0.4-bb.0 |
    |uds-capability-gitlab    |0.1.2      |

## Decision

We will adopt the standalone versioning and not inherit the version from any upstream helm chart. Version 1.0.0 will be
reserved for a fully graduated capability that is ready for customers use.

## Consequences

### Pros

- We can set our own standards for versioning and clearly communicate the consequences of each type of version change
to customers.
- Allows for the possibility that more than one upstream could exist in a single capability

### Cons

- More onus on the dev team to make detailed release notes for each version change
- Users might not immediately know what version of "gitlab" they are running/where to look for docs - based off
tag/release version alone.
