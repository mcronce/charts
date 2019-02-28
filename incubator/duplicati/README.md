# Duplicati
This is a helm chart for [Duplicati][duplicati]

## TL;DR;
```console
helm install --set server_name=matrix.example.org incubator/duplicati
```

## Installing the Chart
To install the chart with the release name `my-release`:

```console
helm install --name my-release incubator/duplicati
```

## Uninstalling the Chart
To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
The following tables lists the configurable parameters of the Duplicati chart and their default values.

| Parameter                          | Description                                                                                                                        | Default               |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `image.repository`                 | Image repository                                                                                                                   | `duplicati/duplicati` |
| `image.tag`                        | Image tag. Possible values listed [here][docker].                                                                                  | `release-2.9.4`       |
| `image.pullPolicy`                 | Image pull policy                                                                                                                  | `IfNotPresent`        |
| `extraLabels`                      | Additional labels to apply to all created resources                                                                                | `{}`                  |
| `service.annotations`              | Annotations for Service resource                                                                                                   | `{}`                  |
| `service.type`                     | Type of service to deploy                                                                                                          | `ClusterIP`           |
| `service.clusterIP`                | ClusterIP of service; if blank, it will be selected at random from the cluster CIDR range                                          | `""`                  |
| `service.port`                     | Port to expose service                                                                                                             | `8200`                |
| `service.externalIPs`              | External IPs for service                                                                                                           | `[]`                  |
| `service.loadBalancerIP`           | Load balancer IP                                                                                                                   | `""`                  |
| `service.loadBalancerSourceRanges` | List of IP CIDRs allowed to access the load balancer (if supported)                                                                | `[]`                  |
| `ingress.enabled`                  | Whether or not to deploy the Ingress resource                                                                                      | `false`               |
| `ingress.class`                    | Ingress class (included in annotations)                                                                                            | ``                    |
| `ingress.annotations`              | Ingress annotations                                                                                                                | `{}`                  |
| `ingress.path`                     | Ingress path                                                                                                                       | `/`                   |
| `ingress.hosts`                    | Ingress accepted hostnames                                                                                                         | `[duplicati]`         |
| `ingress.tls`                      | Ingress TLS configuration                                                                                                          | `[]`                  |
| `persistence.config.enabled`       | Use persistent volume to store config                                                                                              | `true`                |
| `persistence.config.size`          | Size of persistent volume claim                                                                                                    | `1Gi`                 |
| `persistence.config.existingClaim` | Use an existing PVC to persist config                                                                                              | ``                    |
| `persistence.config.storageClass`  | Type of persistent volume claim                                                                                                    | ``                    |
| `persistence.config.accessMode`    | PVC access mode                                                                                                                    | `ReadWriteMany`       |
| `persistence.data`                 | REQUIRED.  Volume spec to inject into PodSpec for datastore - usually shared storage, but you can embed a PVC reference if desired | Required              |
| `resources`                        | CPU/Memory resource requests/limits                                                                                                | `{}`                  |
| `nodeSelector`                     | Node labels for pod assignment                                                                                                     | `{}`                  |
| `tolerations`                      | Toleration labels for pod assignment                                                                                               | `[]`                  |
| `affinity`                         | Affinity settings for pod assignment                                                                                               | `{}`                  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
	--set ingress.enabled=true \
	incubator/duplicati
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml incubator/duplicati
```

Read through the [values.yaml](values.yaml) file.

[docker]: https://hub.docker.com/r/duplicati/duplicati
[github]: https://github.com/duplicati/duplicati
[duplicati]: https://duplicati.com/

