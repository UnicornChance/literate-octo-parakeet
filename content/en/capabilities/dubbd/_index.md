---
title: DUBBD Overview
type: docs
weight: 2
draft: true
---

The Defense Unicorns Big Bang Distribution (DUBBD) is a UDS Capability that provides an efficient and simplified solution for deploying [Big Bang's powerful DevSecOps Platform](https://p1.dso.mil/services/big-bang) on your Kubernetes cluster. The platform, powered by Big Bang, consists of application packages bundled as Helm Charts, leveraging Iron Bank's hardened container images to ensure a secure and compliant software delivery environment. DUBBD offers pre-tested and successive upgrades to the DevSecOps Platform. Upgrading to newer versions of the Helm Chart automatically updates the managed container images, ensuring a secure and up-to-date environment.

DUBBD eliminates the complexities of tool configurations and maintenance, making it effortless to deploy Big Bang's essential tools for securing mission applications and obtaining ATO. It is built and maintained by Defense Unicorns, tested on AWS, and offers portability for deployment in various environments, including disconnected environments. DUBBD streamlines the deployment process, allowing application development teams to focus on delivering features and value, while ensuring software development and deployment practices align with best practices and security standards.

DUBBD comes equipped with a comprehensive set of features that simplify the deployment process and enhance application development. With pre-tested upgrades and expert maintenance, DUBBD allows your teams to focus on delivering exceptional software experiences for your mission applications while ensuring security and compliance at every step. Streamline your deployment process with DUBBD and focus on delivering exceptional software experiences for your mission applications. For additional information, please see the [DUBBD GitHub repository](https://github.com/defenseunicorns/uds-package-dubbd#defense-unicorns-big-bang-distro-dubbd).

## Key Features and Benefits

**Simplified Deployment:** DUBBD eliminates the complexities of tool configurations and maintenance, making it effortless to deploy Big Bang's essential tools for securing mission applications and obtaining ATO.

**Built and Maintained by Experts:** Developed and maintained by Defense Unicorns, DUBBD ensures a reliable and high-quality package.

**Tested and Verified on AWS:** DUBBD has been thoroughly tested and verified on AWS, ensuring a seamless deployment experience on this cloud platform.

**Portable and Disconnected Environment Support:** As a Zarf Package, DUBBD is portable, allowing easy deployment when and where needed, even in disconnected environments without internet access.

## Challenges Addressed by DUBBD

**Lack of Expertise:** Big Bang encompasses various tools like Istio, Kiali, Kyverno, and more, which may be unfamiliar to deployment teams. DUBBD eliminates the need for deep expertise, enabling easy deployment without the complexities of tool configurations.

**Application Configuration:** Knowing how to configure applications to work with Big Bang can be difficult. DUBBD abstracts away the intricate configurations, making it straightforward for application development teams to focus on delivering features and value.

**Production System Upgrades:** Upgrading Big Bang in production systems can be challenging. DUBBD includes upgrade capabilities within the package, ensuring seamless software development and deployment practices aligned with best practices and security standards.

**System Compatibility:** Big Bang configuration against different Kubernetes distributions or infrastructures can be a roadblock. DUBBD streamlines compatibility and allows deployment on various environments, including AWS, edge, and on-premises solutions.
