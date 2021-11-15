# ZCSPM Kubernetes Agent Helm Chart

This directory contains a Kubernetes chart to deploy ZCSPM Agent.

## Chart Details

This chart will do the following:

* Create a Namespace
* Create a Configmap with ZCSPM Configurations
* Create a Secret with ZCSPM API keys
* Create a CronJob which runs ZCSPM Agent

## Installing the Chart

To install the chart, use the following:

```console
$ helm install <Release Name> charts/zcspm-agent \
    --set clusterName=<Name of K8s Cluster> \
    --set licenseId=<ZCSPM License Id> \
    --set accountId=<ZCSPM Account Id> \
    --set zcspmEnvironment=<qa/trial/prod/prod1/prod2/prod3> \
    --set zcspmApiAppId=<ZCSPM API App Id> \
    --set zcspmAPIAppSecret=<ZCSPM API App Secret> \
    --set zcspmAPIKey=<ZCSPM API Key> \
    --set clusterHosting=<AKS/AKS-Engine/EKS/VM-hosted/EC2-Instance-hosted/GKE>
```

Put release name as `zcspm-agent`

## Configuration

The following table lists the required ZCSPM configuration parameters along with their default values.

|          Parameter                   |                      Description                      |                   Default                    |                      Required from Customer                     |
| :----------------------------------- | :---------------------------------------------------- | :------------------------------------------- | :------------------------------------------- |
| `clusterName`                   | Kubernetes Cluster Name                                | `-`                        |   `Yes`       |
| `licenseId`                   | ZCSPM API License Id                  | `-`                        |   `Yes`       |
| `accountId`                   | ZCSPM Account Id                                | `-`                        |   `Yes`       |
| `zcspmAPIAppId`                   | ZCSPM API App Id                                | `-`                        |   `Yes`       |
| `zcspmAPIAppSecret`                   | ZCSPM API App Secert                                | `-`                        |   `Yes`       |
| `zcspmAPIKey`                   | ZCSPM API Key                                | `-`                        |   `Yes`       |
| `clusterHosting`                   | Kubernetes Cluster hosting to use                               | `AKS`                        |    `Yes`    |
| `zcspmEnvironment`                   | ZCSPM environment to use                                | `prod`                        |    `No`    |
| `images.zcspmAgentImage.repository`                   | Container image to use                                | `cloudneeticorp/zcspm-agent`                        |    `No`    |
| `images.zcspmAgentImage.tag`                          | Container image tag to deploy                         | `2.13`                                        |    `No`    |
| `images.pullPolicy`                   | Container pull policy                                 | `Always`                               |    `No`    |
| `cronjob.schedule`                   | Schedule for the CronJob                              | `0 12 * * *`                                  |    `No`    |
| `cronjob.concurrencyPolicy`          | `Allow|Forbid|Replace` concurrent jobs                | `Forbid`                                     |    `No`    |
| `cronjob.failedJobsHistoryLimit`     | Specify the number of failed Jobs to keep             | `3`                                          |    `No`    |
| `cronjob.successfulJobsHistoryLimit` | Specify the number of completed Jobs to keep          | `2`                                          |    `No`    |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

## Upgrading the Chart

To upgrade the chart, use the following:

```console
$ helm upgrade [RELEASE] charts/zcspm-agent [flags] --reuse-values
```
Specify parameter using the `--set key=value[,key=value]` argument to `helm upgrade`  in order to modify earlier set values.

## Rollback to the previous version

To rollback to the previous version, use the following:

```console
$ helm rollback <RELEASE> [REVISION]
```

## Delete

To delete the chart, use the following:

```console
$ helm uninstall <RELEASE>
```
