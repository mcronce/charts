# Matrix appservice for Discord
This is a helm chart for [the Matrix appservice for Discord][home].

## TL;DR:
```console
helm install incubator/matrix-appservice-discord
```

## Discord notes
* To get correct values for `settings.discord.client_id` and `settings.discord.bot_token`, you can follow [this guide][discord_bot_guide]. 
* When you see a guide or set of instructions talking about a "guild" or "guild ID", they're talking about "server" and "server ID", respectively.

## Installing the Chart
To install the chart with the release name `my-release`:

```console
helm install --name my-release incubator/matrix-appservice-discord
```

## Uninstalling the Chart
To uninstall/delete the `my-release` deployment:

```console
helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration
The following tables lists the configurable parameters of the Matrix Discord appservice chart and their default values.

| Parameter                                    | Description                                                                                                                                         | Default                              |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| `image.repository`                           | Image repository                                                                                                                                    | `halfshot/matrix-appservice-discord` |
| `image.tag`                                  | Image tag. Possible values listed [here][docker].                                                                                                   | `latest`                             |
| `image.pullPolicy`                           | Image pull policy                                                                                                                                   | `Always`                             |
| `settings.url_override`                      | URL "from the standpoint of" your Matrix server; if the Matrix server is running in the same Kubernetes cluster, you can probably leave this alone. | svcname.nsname.svc.cluster.local     |
| `settings.homeserver.domain`                 | REQUIRED.  Domain name for homeserver                                                                                                               | Required                             |
| `settings.homeserver.url`                    | REQUIRED.  URL to homeserver                                                                                                                        | Required                             |
| `settings.discord.client_id`                 | REQUIRED.  Client ID for Discord bot                                                                                                                | Required                             |
| `settings.discord.bot_token`                 | REQUIRED.  Auth token for Discord bot                                                                                                               | Required                             |
| `settings.bridge.presenceInterval`           | Interval, in milliseconds, to process users in the 'presence queue'.  This has a minimum value of 250.                                              | `500`                                |
| `settings.bridge.disablePresence`            | Disable setting presence for 'ghost users' which means Discord users on Matrix will not be shown as away or online.                                 | `false`                              |
| `settings.bridge.disableTypingNotifications` | Disable sending typing notifications when somebody on Discord types.                                                                                | `false`                              |
| `settings.bridge.disableDeletionForwarding`  | Disable deleting messages on Discord if a message is redacted on Matrix.                                                                            | `false`                              |
| `settings.bridge.enableSelfServiceBridging`  | Enable users to bridge rooms using !discord commands. See https://t2bot.io/discord for instructions.                                                | `false`                              |
| `settings.bridge.disableReadReceipts`        | Disable sending of read receipts for Matrix events which have been successfully bridged to Discord.                                                 | `false`                              |
| `service.type`                               | Kubernetes service type for the Matrix Discord appservice API                                                                                       | `ClusterIP`                          |
| `service.clusterIP`                          | ClusterIP for the Matrix Discord appservice service; the default (empty string) will cause it to be auto-assigned                                   | `""`                                 |
| `service.port`                               | Kubernetes port where the Matrix Discord appservice is exposed                                                                                      | `9005`                               |
| `service.annotations`                        | Service annotations for the Matrix Discord appservice                                                                                               | `{}`                                 |
| `service.labels`                             | Custom labels                                                                                                                                       | `{}`                                 |
| `service.loadBalancerIP`                     | Load balancer IP for the Matrix Discord appservice                                                                                                  | `{}`                                 |
| `service.loadBalancerSourceRanges`           | List of IP CIDRs allowed access to load balancer (if supported)                                                                                     | None                                 |
| `service.externalTrafficPolicy`              | Set the externalTrafficPolicy in the Service to either Cluster or Local                                                                             | `Cluster`                            |
| `ingress.enabled`                            | Enables Ingress                                                                                                                                     | `false`                              |
| `ingress.annotations`                        | Ingress annotations                                                                                                                                 | `{}`                                 |
| `ingress.labels`                             | Custom labels                                                                                                                                       | `{}`                                 |
| `ingress.path`                               | Ingress path                                                                                                                                        | `/`                                  |
| `ingress.hosts`                              | Ingress accepted hostnames                                                                                                                          | `matrix-appservice-discord`          |
| `ingress.tls`                                | Ingress TLS configuration                                                                                                                           | `[]`                                 |
| `persistence.data.enabled`                   | Use persistent volume to store data                                                                                                                 | `true`                               |
| `persistence.data.size`                      | Size of persistent volume claim                                                                                                                     | `128Mi`                              |
| `persistence.data.existingClaim`             | Use an existing PVC to persist data                                                                                                                 | ``                                   |
| `persistence.data.storageClass`              | Type of persistent volume claim                                                                                                                     | ``                                   |
| `persistence.data.accessMode`                | Persistence access modes                                                                                                                            | `ReadWriteMany`                      |
| `resources`                                  | CPU/Memory resource requests/limits                                                                                                                 | `{}`                                 |
| `nodeSelector`                               | Node labels for pod assignment                                                                                                                      | `{}`                                 |
| `tolerations`                                | Toleration labels for pod assignment                                                                                                                | `[]`                                 |
| `affinity`                                   | Affinity settings for pod assignment                                                                                                                | `{}`                                 |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install --name my-release \
  --set settings.homeserver.domain="example.org" \
    incubator/matrix-appservice-discord
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install --name my-release -f values.yaml incubator/matrix-appservice-discord
```

Read through the [values.yaml](values.yaml) file. It has several commented out suggested values.

[home]: https://github.com/Half-Shot/matrix-appservice-discord
[docker]: https://hub.docker.com/r/halfshot/matrix-appservice-discord
[discord_bot_guide]: https://www.codementor.io/garethdwyer/building-a-discord-bot-with-python-and-repl-it-miblcwejz#creating-a-bot-in-discord-and-getting-a-token

