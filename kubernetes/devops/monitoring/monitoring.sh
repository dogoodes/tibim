#!/bin/bash

echo "Creating namespace"
kubectl create -f namespace.yml --validate=false

echo "Creating service"
kubectl create -f elasticsearch-service.yml --validate=false

echo "Creating persistence volume claim"
kubectl create -f elasticsearch-persistentvolumeclaim.yml --validate=false

echo "Creating statefulset"
kubectl create -f elasticsearch-statefulset.yml --validate=false
