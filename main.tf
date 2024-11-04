module "magalu_kubernetes_cluster" {
  source = "github.com/descomplicando-terraform/granato_module-magalu-kubernetes?ref=v1.0.0"

  cluster_name        = var.cluster_name
  cluster_description = var.cluster_description
  kubernetes_version  = var.kubernetes_version
  nodepool_name       = var.nodepool_name
  nodepool_flavor     = var.nodepool_flavor_name
  nodepool_replicas   = var.nodepool_replicas
  timer_duration      = var.timer_duration

}
