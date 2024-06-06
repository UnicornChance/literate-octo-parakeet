# 14. Standardizing on How We Dev and Test Kubernetes

Date: 2023-10-11

## Status

Accepted

## Context

Currently, our primary tool for quickly developing and testing containerized Kubernetes clusters is k3d. However, usage of kind, k3s on baremetal or ephemeral VMs have also been observed. The deployment methodologies for k3d vary, leading to inconsistencies and challenges, particularly for new employees who struggle to become self-sufficient due to lack of clear setup instructions. The absence of a common pattern for local development and a shared "knowledge base" for setup instructions across different operating systems and container engines further exacerbates the issue. This scenario often results in a "choose your own adventure" dilemma for setup, making troubleshooting a time-consuming task.

Options:

    Prescriptive Configuration:
        Prescribe a single source of truth for k3d with an exact configuration for local dev, cloud testing, and CI jobs.
        Pros: Provides a unified development experience, reducing setup issues and troubleshooting time.
        Cons: Limits testing in varied setups mimicking real-world environments, potentially making our software fragile. Any expansion of configurations or cluster flavors would require a new ADR.

    Flexible Configuration Repository:
        Establish a common repository for cluster deployment processes and configurations, offering flexibility to extend different options for diverse testing.
        The repository could be specific to k3d or a "monorepo" for deploying different Kubernetes flavors using common cloud deployment code (e.g., deploying EC2 instances with OpenTofu, pulumi, CloudFormation or other infra deployment tools).
        Pros: Reduces code duplication, serves as a single source of truth, and allows for testing diversity.
        Cons: Initial setup may be more involved and may require diligent maintenance to prevent breaking changes during updates.

Independently of the chosen option, competent documentation will be provided alongside a platform for engineers to share notes, "gotchas", and other supplemental documentation, to prevent the repetitive resolution of the same issues.

## Decision

We've opted for creating a common repository named uds-common-k8s for local development, CI, and testing across Kubernetes distributions. This repository will house common deployment patterns for different Kubernetes cluster types, OpenTofu or its equivalent for deploying resources into AWS, and a GitHub Action interface for CI setup. Although initially tailored for GitHub, future expansions to include GitLab or other CI systems are not ruled out but are out of scope for this ADR.

The configurations for these environments will be outlined in a follow-up ADR. This repository will also feature clear README instructions for each deployment type and host a developer knowledge base either within markdown folders in the repository or a GitHub wiki "knowledge base."

The process moving forward will involve using the existing [k3d-action](https://github.com/defenseunicorns/uds-aws-ci-k3d) repo, transitioning to the uds-common-k8s repo once it's built out, tested, and accepted by a sample of our developers. A comprehensive write-up on usage will be disseminated across the organization. Subsequent work to support new Kubernetes flavors/config patterns or to remove existing ones will be identified, POCed, and documented in new ADRs without having to supersede this ADR.

## Consequences

Initial churn and additional dev cycles will be required to implement the decisions from this ADR. However, post-implementation, a formalized process will lead to enhanced developer experience and consistency across product development endeavors without fostering unnecessary technical diversity or over-prescribing a single pattern that may render our tools fragile atop these environments.
