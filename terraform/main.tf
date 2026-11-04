terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "api" {
  metadata {
    name = "kubernetesterraformpoc-api"
    labels = {
      app = "kubernetesterraformpoc-api"
    }
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "kubernetesterraformpoc-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "kubernetesterraformpoc-api"
        }
      }

      spec {
        container {
          name  = "api"
          image = "kubernetesterraformpoc:v1"
          image_pull_policy = "Never"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "api" {
  metadata {
    name = "kubernetesterraformpoc-service"
  }

  spec {
    selector = {
      app = "kubernetesterraformpoc-api"
    }

    port {
      port        = 80
      target_port = 8080
    }

    type = "NodePort"
  }
}