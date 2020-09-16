# Cloudneeti Kubernetes Agent Helm Chart

This directory contains a Kubernetes chart to deploy Cloudneeti Agent.

## Chart Details

This chart will do the following:

* Create a Namespace
* Create a Configmap with Cloudneeti Configurations
* Create a Secret with Cloudneeti API keys
* Create a CronJob which runs Cloudneeti Agent

## Installing the Chart

To install the chart, use the following:

```console
$ helm install <Release Name> charts/cloudneeti-agent \
    --set clusterName=<Name of K8s Cluster> \
    --set licenseId=<Cloudneeti License Id> \
    --set accountId=<Cloudneeti Account Id> \
    --set cloudneetiApiAppId=<Cloudneeti API App Id> \
    --set cloudneetiAPIAppSecret=<Cloudneeti API App Secret> \
    --set cloudneetiAPIKey=<Cloudneeti API Key> \
    --set clusterHosting=<AKS/AKS-Engine/EKS/VM-Based/EC2-Instance-Based>
```

Put release name as `cloudneeti-agent`

## Configuration

The following table lists the required Cloudneeti configuration parameters along with their default values.

|          Parameter                   |                      Description                      |                   Default                    |                      Required from Customer                     |
| :----------------------------------- | :---------------------------------------------------- | :------------------------------------------- | :------------------------------------------- |
| `clusterName`                   | Kubernetes Cluster Name                                | `-`                        |   `Yes`       |
| `licenseId`                   | Cloudneeti API License Id                  | `-`                        |   `Yes`       |
| `accountId`                   | Cloudneeti Account Id                                | `-`                        |   `Yes`       |
| `cloudneetiAPIAppId`                   | Cloudneeti API App Id                                | `-`                        |   `Yes`       |
| `cloudneetiAPIAppSecret`                   | Cloudneeti API App Secert                                | `-`                        |   `Yes`       |
| `cloudneetiAPIKey`                   | Cloudneeti API Key                                | `-`                        |   `Yes`       |
| `clusterHosting`                   | Kubernetes Cluster hosting to use                               | `AKS`                        |    `Yes`    |
| `cloudneetiEnvironment`                   | Cloudneeti environment to use                                | `prod`                        |    `No`    |
| `image.repository`                   | Container image to use                                | `cloudneeticorp/cloudneeti-agent`                        |    `No`    |
| `image.tag`                          | Container image tag to deploy                         | `2.8`                                        |    `No`    |
| `image.pullPolicy`                   | Container pull policy                                 | `IfNotPresent`                               |    `No`    |
| `cronjob.schedule`                   | Schedule for the CronJob                              | `0 12 * * *`                                  |    `No`    |
| `cronjob.concurrencyPolicy`          | `Allow|Forbid|Replace` concurrent jobs                | `Forbid`                                     |    `No`    |
| `cronjob.failedJobsHistoryLimit`     | Specify the number of failed Jobs to keep             | `3`                                          |    `No`    |
| `cronjob.successfulJobsHistoryLimit` | Specify the number of completed Jobs to keep          | `2`                                          |    `No`    |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

## Upgrading the Chart

To upgrade the chart, use the following:

```console
$ helm upgrade [RELEASE] charts/cloudneeti-agent [flags] --reuse-values
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
