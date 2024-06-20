# 6. Software Factory Pull Request Test Trigger Method

Date: 2023-07-13

## Status

Accepted

## Context

When pull requests are created we need to decide as a team how tests should be triggered, whether automatically, manually or both.

### Our Options

1. Purely using manual test triggers using Slash Command Dispatch.
1. Run automatically on pull_request types opened, reopened, synchronize, ready_for_review
1. A combination of manual triggers using Slash Command Dispatch.
    - We will use Slash Command Dispatch to allow for manually triggering tests via a `/test all` comment in the pull request.
    - We will trigger tests automatically with **at least one** or possibly both of the following methods.
        - When a reviewer is requested on a pull request using auto label generation to key off of.
        - When a pull request is not a draft pull request.

Option 2 above is what the rest of UDS does now. But that shouldn't stop us from making the best decision for our particular use case, even if it is different than what the rest of UDS does.

## Decision

- We will always trigger the tests on every commit to main.
- For PRs, we will use the manual "Slash Command Dispatch" method.
- It is an outstanding decision to be documented by another ADR as to whether we will require the tests to run before being able to merge a PR.

## Consequences

### Pros
- We will have more control over when it is appropriate to execute a test as some tests will cost real infrastructure $$$.
- We can easily manually trigger subsequent tests as discussion is had and changes are made.
- 3rd party contributors who are submitting PRs from fork may fully participate in the development process.

### Cons
- It requires human interaction to run the tests, which will likely increase our development cycle times a small amount.
