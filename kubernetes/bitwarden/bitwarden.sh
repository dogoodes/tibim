#!/bin/bash

echo "Creating service"
kubectl create -f jenkins-service.yml --validate=false

echo "Creating persistence volume claim"
kubectl create -f jenkins-persistentvolumeclaim.yml --validate=false

echo "Creating statefulset"
kubectl create -f jenkins-statefulset.yml --validate=false
