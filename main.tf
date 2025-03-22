module "magalu_kubernetes_cluster" {
  source = "github.com/descomplicando-terraform/granato_module-magalu-kubernetes?ref=v1.1.0"

  cluster_name         = var.cluster_name
  cluster_description  = var.cluster_description
  kubernetes_version   = var.kubernetes_version
  nodepool_name        = var.nodepool_name
  nodepool_replicas    = var.nodepool_replicas
  enabled_server_group = var.enabled_server_group
  region               = var.region

}
