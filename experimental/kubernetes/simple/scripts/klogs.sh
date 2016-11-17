#!/bin/sh

RC=`kubectl get rc -l stack=$1 --namespace=spinnaker | tail -n +2 | cut -d" " -f1`
POD=`kubectl get pods -l replication-controller="${RC}" | tail -n +2 | cut -d" " -f1`

echo "Starting log on $POD"
k logs -f $POD
