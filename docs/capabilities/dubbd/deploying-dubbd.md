---
title: Deploy DUBBD
type: docs
weight: 3
---

## DUBBD Prerequisites

Before you can deploy the Defense Unicorns Big Bang Distro, make sure you have the following prerequisites in place:

- **Zarf CLI:** Ensure that Zarf CLI is installed locally, with a minimum version of v0.29.0.
- **Kubernetes Cluster:** You should have a Kubernetes cluster at version 1.26 or higher.
- **Zarf Init Package:** Your cluster should have the [Zarf init Package](https://docs.zarf.dev/docs/create-a-zarf-package/zarf-init-package) deployed, including the git-server component.
- **Kubernetes Context:** Ensure that your local Kubernetess context is pointing to the above cluster.
- **Docker Configuration:** Ensure you have a `~/.docker/config.json` file as Zarf requires this for deploying from an OCI registry.

## Configure DUBBD

The recommended way to configure DUBBD is by using a `zarf-config.yaml` file located in the directory where you will be performing the deployment. Below is a sample `zarf-config.yaml` file with the available configurations:

```yaml
    deploy:
    set:
      # -- Domain name for the cluster
      domain: bigbang.dev
      # -- TLS key
      key_file: bigbang.dev.key
      # -- TLS cert
      cert_file: bigbang.dev.cert
```

{{% alert-note %}}
Please note that `key_file` and `cert_file` are the paths to local files that will be used for Istio's TLS configuration.
{{% /alert-note %}}

## Deploy the DUBBD Package

Once you have met all the prerequisites and configured the `zarf-config.yaml` file, you can deploy DUBBD using the following commands:

### Deploy from the OCI (Recommended)

```bash
zarf package deploy \
  oci://ghcr.io/defenseunicorns/packages/dubbd:<VERSION>-amd64 \
  --oci-concurrency=15 \
  --confirm
```

{{% alert-note %}}
Please note that package versions can be found in the [Defense Unicorns GHCR repository](https://github.com/defenseunicorns/uds-package-dubbd/releases).
{{% /alert-note %}}

### If Developing Locally

```bash
zarf package deploy --confirm zarf-package-dubbd-*.tar.zst
```

## (Optional) Verify DUBBD Health

By conducting health checks, you can identify any potential issues or anomalies in your DUBBD deployment. Perform the following checks to verify the health of your DUBBD deployment:

**Step 1: Confirm Helm Release Reconciliation**

Helm releases play a critical role in managing your Kubernetes applications. To ensure they are reconciled and in a healthy state, execute the following command:

```bash
zarf tools kubectl get hr -n bigbang -l app.kubernetes.io/part-of=bigbang
```

**Expectation:** In the output, verify that the `STATUS` column shows "Release reconciliation succeeded" for all Helm releases.

**Step 2: Confirm Flux Pods**

Flux is responsible for synchronizing your cluster with your Git repository. It's important that Flux pods are running correctly. Run the following command to check their status:

```bash
zarf tools kubectl get pod -n flux-system
```

**Expectation:** The pods should have a `STATUS` of "Running" and show as "READY" 1/1 for each Flux pod.

**Step 3: Confirm DUBBD Pods**

DUBBD runs various components across different namespaces. To ensure the overall health of your deployment, examine all pods in all namespaces by running the following command:

```bash
zarf tools kubectl get pod -A
```

**Expectation:** Check for a `STATUS` of "Running" and "READY" x/x for each DUBBD pod in all namespaces.
