# 12. UDS Bundle Collab Definition

Date: 2023-10-16

## Status

Accepted

## Context

Collaboration tools facilitate broad high-level communication, documentation (knowledge management), and workflow tracking for collocated and distributed teams alike. Historically, our most important national workforce - the civilians, contractors, and military members supporting the Defense Department and broader Federal government - have had limited or no access to these kinds of tools. Further, solutions once bursting with promise (Microsoft Sharepoint, Defense Intelligence Information Environment (DI2E), Microsoft Teams Commercial Virtual Remote (CVR)) prove to be volatile and are removed with no clear succession plan. Defense Unicorns is uniquely positioned to develop, support, and maintain a _free (?)_ suite of collaboration tools as a UDS Bundle or components of a UDS Bundle.

### Guiding Principles

* Use Free and Open Source Software where practical
* The solution will be delivered using a now, next, later approach
  * The team will focus on delivering a thin functional thread, also referred to as a Minimum Viable Product (MVP)
  * The MVP will be complemented with additional features and capabilities next
  * The initial delivery will reach feature completeness later

## Assessment of Alternatives

Collaboration tools fall into three categories:

1. real-time communication
2. knowledge management
3. workflow tracking

The tools assessed may satisfy one or more of these categories.

### Real-time communication

|  | ChatOps | Voice Chat | Screen Share | Video Chat | Open Source | License | Notes
| -- | :-: | :-: | :-: | :-: | :-: | :-: | -- |
| [Mattermost](https://mattermost.com/) | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | Free | Self-hosted<br />Keycloak integration available through [GitLab auth settings](https://repo1.dso.mil/big-bang/product/packages/mattermost/-/blob/main/docs/keycloak.md)<br />HA configuration requires [Enterprise License](https://docs.mattermost.com/scale/high-availability-cluster.html) |
| [RocketChat](https://www.rocket.chat/) | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | $$$ | Free version available but IDAM integration requires Enterprise license |
| [Matrix (Synapse)](https://matrix-org.github.io/synapse/latest/usage/configuration/config_documentation.html) | :heavy_check_mark: | :heavy_multiplication_x: | :heavy_multiplication_x: | :heavy_multiplication_x: | :heavy_check_mark: | Apache-2.0 | Several modules exist to extend functionality (video chat, etc)

### Knowledge management

|  | RBAC | Open Source | License | Notes |
| -- | :-: | :-: | :-: | -- |
| [Confluence](https://www.atlassian.com/software/confluence) | :heavy_check_mark: | :heavy_multiplication_x: | $42k / year / up to 500 users | Very expensive<br />Vulnerability delivery vehicle<br />Everybody loves it |
| [GitLab](https://about.gitlab.com/) | :heavy_check_mark: | :heavy_check_mark: | $29/user/month | Self Managed<br />No access control available for [wikis](https://docs.gitlab.com/ee/user/permissions.html)<br />Limited RBAC capabilities through [Pages](https://docs.gitlab.com/ee/user/project/pages/pages_access_control.html) feature<br />Some features require Premium license |
| [XWiki](https://www.xwiki.org/xwiki/bin/view/Main/WebHome) | :heavy_check_mark: | :heavy_check_mark: | LGPL | Serious contender |
| [WikiJs](https://js.wiki/) | :heavy_check_mark: | :heavy_check_mark: | AGPLv3 | Less feature rich than XWiki |
| [OpenProject](https://www.openproject.org) | :heavy_check_mark: | :heavy_check_mark: | GPLv3 | Wiki capability built into Jira replacement<br />Enterprise license unlocks useful features |

### Workflow tracking

|  | RBAC | HelpDesk | Open Source | License | Notes |
| -- | :-: | :-: | :-: | :-: | -- |
| [Jira](https://www.atlassian.com/software/jira) | :heavy_check_mark: | :heavy_check_mark: | :heavy_multiplication_x: | $42k / year / up to 500 users | Very expensive<br />Vulnerability delivery vehicle<br />Everybody loves it |
| [GitLab](https://about.gitlab.com/) | :heavy_check_mark: | :dollar: | :heavy_check_mark: | $29/user/month | Self Managed<br />Some features require enterprise license |
| [OpenProject](https://www.openproject.org) | :heavy_check_mark: | :question: | :heavy_check_mark: | GPLv3 | Jira replacement<br />Enterprise license unlocks useful features |

## Decision

We will produce two Collaboration Bundles:

1. UDS Bundle Collab Premium -> Mattermost + Jira + Confluence
1. UDS Bundle Collab Libre -> Mattermost + XWiki + OpenProject

## Consequences

The Premium UDS Collaboration Bundle is prohibitively expensive for organizations with small budgets; licenses for 1-500 users will cost $84k / year.

Securing the UDS Collaboration Bundle with Atlassian containers is impossible.

The Libre UDS Collaboration Bundle has dependencies on Solr and memcached which are not currently planned UDS Capabilities.
