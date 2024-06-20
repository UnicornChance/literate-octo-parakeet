# 2. Versioning of DUBBD and Disassociation from Big Bang Versioning

Date: 2023-04-13

## Status

Draft

## Context

[Big Bang](https://p1.dso.mil/products/big-bang) - a DoD-hardened DevSecOps platform - follows its own defined release
cadence (at the time of writing this ADR it is every 2 weeks). The Defense Unicorns Big Band Distribution (DUBBD), which
utilizes the upstream Big Bang release may have changes outside of the Big Bang release cycle. Currently, both projects
are versioned together, which can cause confusion and makes it difficult to track changes and dependencies.
Additionally, there may be cases where a breaking change in BigBang does not cause a breaking change in DUBBD or a
breaking change of DUBBD is not caused by a breaking change Big Bang, so aligning the semantic versioning doesn't
provide the context desired.

## Decision

We will disassociate the versioning of DUBBD from the versioning of Big Bang. DUBBD will have its own independent
versioning scheme, which will make it easier to track changes and dependencies. This will also allow for the possibility
of a breaking change in one project without affecting the other.

## Consequences

The main consequence of this decision is that we will need to maintain and compatibility matrix for which versions of
BigBang DUBBD contains. This may require additional resources and careful coordination between the two projects.
However, this is a necessary trade-off to avoid confusion and make it easier to track changes and dependencies.
Additionally, this decision will allow for more flexibility in managing changes and updates to DUBBD and Big Bang.
