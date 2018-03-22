#!/bin/bash


echo "Creating namespace"
kubectl create -f namespace.yml --validate=false

echo "Creating ingress"
kubectl create -f nexus-ingress.yml --validate=false

echo "Creating service"
kubectl create -f nexus-service.yml --validate=false

echo "Creating persistence volume claim"
kubectl create -f nexus-persistentvolumeclaim.yml --validate=false

echo "Creating statefulset"
kubectl create -f nexus-statefulset.yml --validate=false
