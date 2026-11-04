# 🚀 Kubernetes Terraform PoC

> Cloud-Native Platform Engineering Proof of Concept using .NET 10, Docker, Kubernetes, and Terraform.

![.NET](https://img.shields.io/badge/.NET-10-purple)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Minikube-blue)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED)
![Platform Engineering](https://img.shields.io/badge/Platform-Engineering-success)

---

# 📖 Overview

This project demonstrates how to build, containerize, deploy, and manage a modern cloud-native .NET application using Kubernetes and Terraform.

The objective is to showcase fundamental Platform Engineering and Infrastructure as Code (IaC) concepts including:

- .NET 10 Minimal APIs
- Docker Containerization
- Kubernetes Deployments
- Kubernetes Services
- Health Probes
- Self-Healing Workloads
- Scaling and Replicas
- Terraform-based Infrastructure Management
- Production-oriented Cloud-Native Architecture

The solution was developed as a learning and architecture proof of concept to understand how enterprise applications are deployed and operated on modern Kubernetes platforms such as Azure Kubernetes Service (AKS), Amazon EKS, and Google Kubernetes Engine (GKE).

---

# 🏗️ Solution Architecture

```text
┌─────────────────────┐
│ .NET 10 Web API     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Docker Container    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Kubernetes Pod      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Deployment          │
│ ReplicaSet          │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Kubernetes Service  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Minikube Cluster    │
└─────────────────────┘

Infrastructure Managed By

Terraform
    │
    ▼
Kubernetes Provider
    │
    ▼
Minikube Cluster
```

---

# ✨ Features

## .NET 10 Minimal API

Simple API endpoint exposing application status.

```csharp
app.MapGet("/", () => new
{
    environment = app.Environment.EnvironmentName,
    message = "Hello from .NET 10 Platform Architecture PoC!",
    timestamp = DateTime.UtcNow
});
```

---

## Kubernetes Health Checks

### Liveness Endpoint

```http
GET /health/live
```

Used by Kubernetes to determine:

> Should this container be restarted?

---

### Readiness Endpoint

```http
GET /health/ready
```

Used by Kubernetes to determine:

> Is this application ready to receive traffic?

---

## Container Security

The application runs as a non-root user inside the container.

```dockerfile
USER appuser
```

This follows modern container security best practices.

---

# ☸ Kubernetes Concepts Demonstrated

## Pods

Smallest deployable unit in Kubernetes.

```text
Pod
 └── .NET Application Container
```

---

## Deployments

Manage application lifecycle and desired state.

Example:

```text
Desired Replicas = 2
Actual Replicas  = 2
```

If a pod fails:

```text
Pod Failure
      ↓
ReplicaSet Detects Issue
      ↓
New Pod Automatically Created
```

---

## ReplicaSets

Ensure the desired number of application instances remain running.

Example:

```yaml
replicas: 2
```

Provides:

- High Availability
- Self-Healing
- Horizontal Scaling

---

## Services

Provide stable networking and service discovery.

```text
Service
   ↓
Pod A
Pod B
```

Traffic is automatically distributed across healthy pods.

---

# 🐳 Docker

Build application image:

```bash
docker build -t kubernetesterraformpoc:v1 .
```

Load image into Minikube:

```bash
minikube image load kubernetesterraformpoc:v1
```

---

# 🌍 Infrastructure as Code with Terraform

This project manages Kubernetes resources using Terraform.

Benefits include:

✅ Version Control

✅ Repeatable Deployments

✅ Automated Provisioning

✅ Infrastructure Review

✅ Change Tracking

✅ Environment Consistency

Example deployment:

```hcl
resource "kubernetes_deployment" "api" {
  metadata {
    name = "kubernetesterraformpoc-api"
  }

  spec {
    replicas = 2
  }
}
```

---

# 📂 Project Structure

```text
KubernetesTerraformPoC
│
├── Program.cs
├── Dockerfile
├── README.md
│
├── kubernetes
│   ├── deployment.yaml
│   └── service.yaml
│
└── terraform
    ├── main.tf
    ├── terraform.tfstate
    └── terraform.lock.hcl
```

---

# 🚀 Getting Started

## Prerequisites

- .NET 10 SDK
- Docker Desktop
- Minikube
- kubectl
- Terraform

---

## Start Kubernetes

```bash
minikube start
```

Verify:

```bash
kubectl get nodes
```

---

## Build Docker Image

```bash
docker build -t kubernetesterraformpoc:v1 .
```

---

## Load Image into Minikube

```bash
minikube image load kubernetesterraformpoc:v1
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Review Infrastructure Plan

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

---

## Verify Deployment

```bash
kubectl get deployments
kubectl get pods
kubectl get services
```

---

# 🧠 Key Learning Outcomes

This proof of concept demonstrates practical experience with:

### Platform Engineering

- Kubernetes Architecture
- Service Discovery
- Deployment Strategies
- Health Monitoring
- Workload Management

### DevOps

- Docker
- Infrastructure as Code
- Terraform
- Declarative Configuration
- Environment Provisioning

### Cloud Native Principles

- Self-Healing Applications
- Horizontal Scaling
- Immutable Infrastructure
- Container Orchestration
- High Availability

---

# 🔮 Future Enhancements

Potential next steps include:

- ConfigMaps
- Secrets Management
- Persistent Volumes
- Horizontal Pod Autoscaler (HPA)
- NGINX Ingress Controller
- GitHub Actions CI/CD
- Azure Container Registry (ACR)
- Azure Kubernetes Service (AKS)
- Helm Charts
- ArgoCD GitOps
- Monitoring with Prometheus & Grafana

---

# 👨‍💻 Author

**Rameshkumar**

Engineering Manager | Cloud Architecture | Kubernetes | Terraform | Azure | .NET

Passionate about Platform Engineering, Cloud-Native Architecture, Developer Experience, and Infrastructure Automation.

---

# ⭐ Why This Project Matters

This project demonstrates the complete cloud-native application lifecycle:

```text
Source Code
      ↓
.NET 10 Application
      ↓
Docker Container
      ↓
Kubernetes Deployment
      ↓
Health Monitoring
      ↓
Terraform Automation
      ↓
Infrastructure as Code
      ↓
Modern Platform Engineering
```

A practical demonstration of technologies and patterns commonly used in enterprise-scale Kubernetes environments.