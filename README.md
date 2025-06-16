# Harness + EKS Demo
This is a working CI/CD pipeline that deploys a containerized application to an Amazon EKS cluster using Harness.

## 🔧 What This Repo Does
- Builds a Docker image from source
- Pushes the image to Amazon ECR
- Deploys to EKS via Helm/K8s manifests
- Validates deployment with a post-deploy verification step

## 💡 Tech Stack
- **Harness CI/CD** for pipeline orchestration
- **Amazon EKS** for Kubernetes hosting
- **Amazon ECR** for container registry

## 🚀 Quick Summary
This setup enables automated, production-grade Kubernetes deployments with minimal manual effort. From code to container to cluster — all in under 5 minutes.

*Built for demo purposes. Ask me how to set this up for your team.*