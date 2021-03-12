#!/bin/bash
set -e

SCRIPT_DIR=$(dirname "$0")
. $SCRIPT_DIR/Constants.sh

mkdir -p $SCRIPT_DIR/tmp

export AZURESTACKHCI_CLUSTER_RESOURCE_GROUP=testgroup
export AZURESTACKHCI_CONTROL_PLANE_MACHINE_TYPE=Default
export AZURESTACKHCI_CONTROL_PLANE_HOST_TYPE=baremetal
export AZURESTACKHCI_LOAD_BALANCER_MACHINE_TYPE=Default
export AZURESTACKHCI_LOAD_BALANCER_HOST_TYPE=baremetal
export AZURESTACKHCI_VNET_NAME=External
export AZURESTACKHCI_WINDOWS_WORKER_MACHINE_COUNT=1
export AZURESTACKHCI_WINDOWS_WORKER_MACHINE_TYPE=Default
export AZURESTACKHCI_WINDOWS_WORKER_HOST_TYPE=baremetal
export AZURESTACKHCI_WORKER_MACHINE_TYPE=Default
export AZURESTACKHCI_WORKER_HOST_TYPE=baremetal
export KUBERNETES_VERSION=v1.18.6

clusterctl config cluster testcluster > $SCRIPT_DIR/tmp/testcluster.yaml
kubectl apply -f $SCRIPT_DIR/tmp/testcluster.yaml