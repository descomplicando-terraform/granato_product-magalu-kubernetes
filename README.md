# Granato Product Magalu Kubernetes

Este repositório utiliza o módulo `granato_module-magalu-kubernetes` para fazer deploy de clusters Kubernetes na Magalu Cloud.

## Visão Geral

Este projeto é um módulo Terraform para a criação e gerenciamento de clusters Kubernetes na Magalu Cloud.

## Como Usar

### Passo 1: Adicione o módulo ao seu arquivo `main.tf`

```hcl
module "magalu_kubernetes_cluster" {
  source  = "github.com/descomplicando-terraform/granato_module-magalu-kubernetes?ref=v1.0.0"
  
  cluster_name        = var.cluster_name
  cluster_description = var.cluster_description
  kubernetes_version  = var.kubernetes_version
  nodepool_name       = var.nodepool_name
  nodepool_flavor     = var.nodepool_flavor
  nodepool_replicas   = var.nodepool_replicas
  timer_duration      = var.timer_duration
}
```

### Passo 2: Configure o GitHub Actions

Crie um arquivo de workflow GitHub Actions no diretório `.github/workflows`. Por exemplo, `main.yml`:

```yaml
name: Deploy Kubernetes Cluster

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Setup Terraform
      uses: hashicorp/setup-terraform@v1

    - name: Initialize Terraform
      run: terraform init

    - name: Plan Terraform
      run: terraform plan -out=tfplan

```

## Requisitos

| Name | Version |
|------|---------|
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.2 |
| <a name="requirement_mgc"></a> [mgc](#requirement\_mgc) | 0.27.1 |

## Provedores

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_magalu_kubernetes_cluster"></a> [magalu\_kubernetes\_cluster](#module\_magalu\_kubernetes\_cluster) | github.com/descomplicando-terraform/granato_module-magalu-kubernetes | v1.0.0 |

## Recursos

No resources.

## Entradas

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_description"></a> [cluster\_description](#input\_cluster\_description) | Cluster description | `string` | `"A Kubernetes cluster managed by Magalu Cloud."` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | `"mgc-cluster"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version | `string` | `"v1.30.2"` | no |
| <a name="input_nodepool_flavor_name"></a> [nodepool\_flavor\_name](#input\_nodepool\_flavor\_name) | Nodepool flavor | `string` | `"cloud-k8s.gp1.small"` | no |
| <a name="input_nodepool_name"></a> [nodepool\_name](#input\_nodepool\_name) | Nodepool name | `string` | `"mgc-nodepool"` | no |
| <a name="input_nodepool_replicas"></a> [nodepool\_replicas](#input\_nodepool\_replicas) | Number of nodepool replicas | `number` | `1` | no |
| <a name="input_timer_duration"></a> [timer\_duration](#input\_timer\_duration) | Timer duration | `string` | `"15m"` | no |

## Saídas

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |


Para mais detalhes, consulte o [README do módulo](https://github.com/descomplicando-terraform/granato_module-magalu-kubernetes/blob/main/README.md).
