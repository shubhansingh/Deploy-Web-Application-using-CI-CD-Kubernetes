resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "my-app"
  }
}

resource "kubernetes_deployment" "frontend" {
  metadata {
    name      = "frontend-deployment"
    namespace = kubernetes_namespace.app_namespace.metadata.0.name
  }
  
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "frontend"
      }
    }
    template {
      metadata {
        labels = {
          app = "frontend"
        }
      }
      spec {
        container {
          name  = "frontend"
          image = "registry.example.com/frontend-image:latest"
          ports {
            container_port = 80
          }
        }
      }
    }
  }
}
