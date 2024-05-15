---
title: Duplicate Packages in a Bundle
type: docs
weight: 2
---

Deploying multiple instances of the same Zarf Package within a bundle allows for the flexible and scalable configuration of applications. This approach can be particularly useful when different instances of an application or service require distinct configurations or when there is a need to scale specific components independently.

For instance, consider an application that requires multiple databases to support various functionalities like user management, content storage, and analytics. Each database may need different configurations, storage capacities, or even be hosted on different platforms. By leveraging multiple instances of a Zarf package, users can efficiently manage and customize application deployments to meet diverse requirements and optimize resource utilization.

## YAML Configuration

Multiple instances of the same Zarf Package can be deployed within a bundle. For example, the `uds-bundle.yaml` file below illustrates the deployment of three instances of the [helm-overrides](https://github.com/defenseunicorns/uds-cli/blob/main/src/test/packages/helm/zarf.yaml)  Zarf Package:

```yaml
kind: UDSBundle
metadata:
   name: duplicates
   description: testing a bundle with duplicate packages in specified namespaces
   version: 0.0.1

packages:
   - name: helm-overrides
     repository: localhost:5000/helm-overrides
     ref: 0.0.1
     overrides:
        podinfo-component:
           unicorn-podinfo: # name of Helm chart
              namespace: podinfo-ns

   # note the unique name and namespace
   - name: helm-overrides-duplicate
     repository: localhost:5000/helm-overrides
     ref: 0.0.1
     overrides:
        podinfo-component:
           unicorn-podinfo:
              namespace: another-podinfo-ns

   # note the unique name, namespace and the path to the Zarf package tarball
   - name: helm-overrides-local-duplicate
     path: src/test/packages/helm/zarf-package-helm-overrides-arm64-0.0.1.tar.zst
     ref: 0.0.1
     overrides:
        podinfo-component:
           unicorn-podinfo:
              namespace: yet-another-podinfo-ns
```

For deploying duplicate packages, adhere to the following naming conventions:

- The `name` field of the package in `uds-bundle.yaml` must be unique.
- Duplicate packages must be deployed in different namespaces.
- To deploy duplicates of local packages, the `path` field must reference a Zarf Package tarball rather than a folder.

{{% alert-note %}}
The feature to deploy duplicate packages is exclusively supported for packages containing Helm charts. This is because Helm charts' namespaces can be overridden at deploy time.
{{% /alert-note %}}
