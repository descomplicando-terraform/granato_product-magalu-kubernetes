# Após a criação do recurso do cluster, o Terraform irá exibir o nome e o ID do cluster criado.

output "cluster_name" {
  value = module.magalu_kubernetes_cluster.cluster_name
}

output "cluster_id" {
  value = module.magalu_kubernetes_cluster.cluster_id
}
