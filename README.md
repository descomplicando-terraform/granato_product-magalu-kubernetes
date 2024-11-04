# Granato Product Magalu Kubernetes

Este repositório utiliza o módulo `granato_module-magalu-kubernetes` para fazer deploy de clusters Kubernetes na Magalu Cloud via GitHub Actions.

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
      with:
        cli_config_credentials_token: ${{ secrets.TF_API_TOKEN }}

    - name: Initialize Terraform
      run: terraform init

    - name: Plan Terraform
      run: terraform plan

    - name: Apply Terraform
      run: terraform apply -auto-approve
```

### Requisitos

| Name                  | Version  |
| --------------------- | -------- |
| Terraform             | >= 1.0.0 |
| Provider Magalu Cloud | 0.21.1   |
| Provider Local        | 2.5.1    |
| Provider Time         | 0.12.0   |

### Inputs do Módulo

| Name                | Description                    | Type     | Default                                                    | Required |
| ------------------- | ------------------------------ | -------- | ---------------------------------------------------------- | :------: |
| cluster_name        | Nome do Cluster                | `string` | `"nataliagranato"`                                         |    no    |
| cluster_description | Descrição do Cluster           | `string` | `"Um cluster de Kubernetes gerenciado pela Magalu Cloud."` |    no    |
| kubernetes_version  | Versão do Kubernetes           | `string` | `"v1.28.5"`                                                |    no    |
| nodepool_name       | Nome do Nodepool               | `string` | `"nataliagranato"`                                         |    no    |
| nodepool_flavor     | Flavor do Nodepool             | `string` | `"cloud-k8s.gp1.small"`                                    |    no    |
| nodepool_replicas   | Número de Réplicas do Nodepool | `number` | `1`                                                        |    no    |
| timer_duration      | Duração do Timer               | `string` | `"15m"`                                                    |    no    |

### Outputs do Módulo

| Name         | Description     |
| ------------ | --------------- |
| cluster_id   | ID do Cluster   |
| cluster_name | Nome do Cluster |

Para mais detalhes, consulte o [README do módulo](https://github.com/descomplicando-terraform/granato_module-magalu-kubernetes/blob/main/README.md).
