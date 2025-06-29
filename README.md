# Harness + EKS (Helm) Demo

This repo contains Helm charts and deployment configuration for running a containerized application on Amazon EKS using Harness and Helm.

## 🔧 What This Repo Does
- Defines a Helm chart for the application
- Supports dynamic Helm values (e.g., image tag, environment, deployer)
- Integrates with Harness pipelines for Helm-based deployments
- Enables Helm Diff for pre-deploy visibility
- Cleanly separates app source code (in another repo) from deployment config

## 💡 Tech Stack
- **Helm** for templated Kubernetes manifests
- **Harness CD & GitOps** for deployment orchestration
- **Amazon EKS** for Kubernetes hosting
- **Amazon ECR** for container registry (artifact pulled from external repo)

## 🚀 Quick Summary
This repo enables clean, fast, and flexible Helm-based deployments of prebuilt application artifacts to EKS. Built for use with Harness pipelines, it supports diff previews, environment-specific overrides, and traceable metadata.

*Built as part of a production-grade CI/CD lab. Ask me how to use this pattern with your stack.*
