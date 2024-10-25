module "magalu_kubernetes_cluster" {
  source = "github.com/descomplicando-terraform/granato_module-magalu-kubernetes?ref=v1.0.0"

  cluster_name        = "nataliagranato"
  cluster_description = "descrição do seu cluster"
  kubernetes_version  = "v1.30.2"
  nodepool_name       = "nodepool-gp1-small"
  nodepool_flavor     = "cloud-k8s.gp1.small"
  nodepool_replicas   = 1
  timer_duration      = "15m"
}
