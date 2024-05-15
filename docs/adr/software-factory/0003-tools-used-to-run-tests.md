# 3. Tools used to run tests

Date: 2023-07-11

## Status

Accepted

## Context

We need to decide what tools we will use to run tests.

We should use tools that are already commonly used in our organization.

Per ADR #0002, the tool(s) used will be identical regardless of whether the tests are run locally or in CI.

Per ADR #0002, the tool(s) used will be used inside the Build Harness container.

## Decision

1. For all tests, we will use Golang tests, such that the tests are run inside Build Harness with `go test` (wrapped by `docker run`, wrapped by `make test`). Golang tests are easy to run inside Build Harness, both locally and in CI.
2. When tests require infrastructure deployments, we will use [Terratest](https://github.com/gruntwork-io/terratest).
3. For any test that is too large to run on a developer's laptop or a GitHub CI runner (whichever is smaller), or requires cloud resources, we will use Terratest to create a beefy EC2 instance in AWS (or whatever other infra is needed), run the test on that instance/infra, and then destroy the instance/infra. This will all happen as part of the test, with the only additional requirement if the test is being run locally being AWS creds available as environment variables.
4. For any test that is small enough to run on a developer's laptop or a GitHub CI runner (whichever is smaller), and does not require any cloud resources to run, we will run the test locally (meaning without using cloud resources) however we deem appropriate, as long as it is still a Golang test that is initiated using `go test`.
5. For these local tests, if they require Docker, we will configure the `docker run` command inside `make test` to mount the docker socket into the container, so that the test can run Docker commands inside the container.

## Consequences

### Pros
- The tool(s) used will be tools that are already commonly used in our organization.
- The tool(s) used will not change between local and CI.
- We will not be constrained by machine size when running tests locally or in CI.
- Test infrastructure will be fully ephemeral.

### Cons
- This pattern assumes that developers do not have a computer that is powerful enough to run certain tests locally. If a developer does have a powerful enough computer, they won't be able to take full advantages of it since the test will still seek to deploy something in the cloud.
- Mounting the docker socket is a security risk, but moreso on GitHub's side than ours. Since they allow it to happen, we trust that they have taken the appropriate security measures to make doing so safe.
