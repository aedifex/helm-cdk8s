#!/bin/bash

# Global variable for your cluster name
CLUSTER_NAME="aedifex-eks-demo"

# Get Cluster Information
echo "Getting cluster information..."
kubectl cluster-info
aws eks describe-cluster --name $CLUSTER_NAME

# Check Nodes Health
echo "Checking node health..."
kubectl get nodes
kubectl describe nodes

# Check Workloads
echo "Checking all pods in all namespaces..."
kubectl get pods --all-namespaces
echo "Checking all deployments in all namespaces..."
kubectl get deployments --all-namespaces
echo "Checking all ReplicaSets in all namespaces..."
kubectl get rs --all-namespaces

# Resource Usage and Metrics
# Make sure metrics-server is installed for these commands to work
echo "Showing CPU and memory usage for nodes..."
kubectl top nodes
echo "Showing CPU and memory usage for pods..."
kubectl top pods --all-namespaces

# Check for Any System Alerts or Events
echo "Listing all events in the cluster..."
kubectl get events --all-namespaces

# Check Kubernetes Control Plane Logs
# Replace [kube-api-server-pod-name], [kube-scheduler-pod-name], and [kube-controller-manager-pod-name] with actual pod names
echo "Checking logs of the Kubernetes API server..."
kubectl logs -n kube-system [kube-api-server-pod-name]
echo "Checking logs of the Kubernetes scheduler..."
kubectl logs -n kube-system [kube-scheduler-pod-name]
echo "Checking logs of the Kubernetes controller manager..."
kubectl logs -n kube-system [kube-controller-manager-pod-name]

# Check Networking
echo "Listing all services in all namespaces..."
kubectl get svc --all-namespaces
echo "Checking Ingress status..."
kubectl describe ingress

# Check Storage
echo "Listing Persistent Volumes..."
kubectl get pv
echo "Listing Persistent Volume Claims in all namespaces..."
kubectl get pvc --all-namespaces

# Security and Compliance
# Ensure Lacework is correctly configured and check the Lacework dashboard for any alerts

# AWS EKS Specific Checks
echo "Listing updates applied to the EKS cluster..."
aws eks list-updates --name $CLUSTER_NAME
# Replace update-id-from-previous-command with actual update ID
echo "Getting details about a specific update..."
aws eks describe-update --name $CLUSTER_NAME --update-id update-id-from-previous-command

# Check for Deprecated APIs
# Requires installing a plugin
echo "Checking for deprecated APIs..."
kubectl deprecations

echo "Health check script execution completed."
