# Matrix appservice for webhooks
This is a helm chart for [the Matrix appservice for webhooks][home].

## TL;DR:
```console
helm install incubator/matrix-appservice-webhooks
```

## Installing the Chart
To install the chart with the release name `my-release`:

```console
helm install --name my-release incubator/matrix-appservice-webhooks
```

## Uninstalling the Chart
To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
The following tables lists the configurable parameters of the Matrix webhooks appservice chart and their default values.

| Parameter                          | Description                                                                                                                                         | Default                                |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| `image.repository`                 | Image repository                                                                                                                                    | `turt2live/matrix-appservice-webhooks` |
| `image.tag`                        | Image tag. Possible values listed [here][docker].                                                                                                   | `latest`                               |
| `image.pullPolicy`                 | Image pull policy                                                                                                                                   | `Always`                               |
| `settings.url_override`            | URL "from the standpoint of" your Matrix server; if the Matrix server is running in the same Kubernetes cluster, you can probably leave this alone. | svcname.nsname.svc.cluster.local       |
| `settings.homeserver.domain`       | REQUIRED.  Domain name for homeserver                                                                                                               | Required                               |
| `settings.homeserver.url`          | REQUIRED.  URL to homeserver                                                                                                                        | Required                               |
| `matrix_secret.name_override`      | Override for Matrix secret name                                                                                                                     | ``                                     |
| `matrix_secret.deploy.enabled`     | Whether or not to deploy the Matrix credentials secret                                                                                              | `false`                                |
| `matrix_secret.deploy.username`    | If deploying the Matrix credentials secret, this username will be injected.  Required if deploying the secret.  Use only the localpart.             | ``                                     |
| `matrix_secret.deploy.password`    | If deploying the Matrix credentials secret, this password will be injected.  Required if deploying the secret.                                      | ``                                     |
| `service.type`                     | Kubernetes service type for the Matrix webhooks appservice API                                                                                      | `ClusterIP`                            |
| `service.clusterIP`                | ClusterIP for the Matrix webhooks appservice service; the default (empty string) will cause it to be auto-assigned                                  | `""`                                   |
| `service.port`                     | Kubernetes port where the Matrix webhooks appservice is exposed                                                                                     | `8090`                                 |
| `service.annotations`              | Service annotations for the Matrix webhooks appservice                                                                                              | `{}`                                   |
| `service.labels`                   | Custom labels                                                                                                                                       | `{}`                                   |
| `service.loadBalancerIP`           | Load balancer IP for the Matrix webhooks appservice                                                                                                 | `{}`                                   |
| `service.loadBalancerSourceRanges` | List of IP CIDRs allowed access to load balancer (if supported)                                                                                     | None                                   |
| `service.externalTrafficPolicy`    | Set the externalTrafficPolicy in the Service to either Cluster or Local                                                                             | `Cluster`                              |
| `ingress.enabled`                  | Enables Ingress                                                                                                                                     | `false`                                |
| `ingress.annotations`              | Ingress annotations                                                                                                                                 | `{}`                                   |
| `ingress.labels`                   | Custom labels                                                                                                                                       | `{}`                                   |
| `ingress.path`                     | Ingress path                                                                                                                                        | `/`                                    |
| `ingress.hosts`                    | Ingress accepted hostnames                                                                                                                          | `matrix-appservice-webhooks`           |
| `ingress.tls`                      | Ingress TLS configuration                                                                                                                           | `[]`                                   |
| `persistence.data.enabled`         | Use persistent volume to store data                                                                                                                 | `true`                                 |
| `persistence.data.size`            | Size of persistent volume claim                                                                                                                     | `128Mi`                                |
| `persistence.data.existingClaim`   | Use an existing PVC to persist data                                                                                                                 | ``                                     |
| `persistence.data.storageClass`    | Type of persistent volume claim                                                                                                                     | ``                                     |
| `persistence.data.accessMode`      | Persistence access modes                                                                                                                            | `ReadWriteMany`                        |
| `resources`                        | CPU/Memory resource requests/limits                                                                                                                 | `{}`                                   |
| `nodeSelector`                     | Node labels for pod assignment                                                                                                                      | `{}`                                   |
| `tolerations`                      | Toleration labels for pod assignment                                                                                                                | `[]`                                   |
| `affinity`                         | Affinity settings for pod assignment                                                                                                                | `{}`                                   |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set timezone="America/New York" \
    incubator/matrix-appservice-webhooks
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml incubator/matrix-appservice-webhooks
```

Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.

[home]: https://github.com/turt2live/matrix-appservice-webhooks
[docker]: https://hub.docker.com/r/turt2live/matrix-appservice-webhooks

