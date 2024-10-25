### README.md

# Granato Product Magalu Kubernetes

Este repositório utiliza o módulo `granato_module-magalu-kubernetes` para fazer deploy de clusters Kubernetes na Magalu Cloud via GitHub Actions.

## Visão Geral

Este projeto utiliza o [módulo](https://github.com/descomplicando-terraform/granato_module-magalu-kubernetes) para a criação e gerenciamento de clusters Kubernetes na Magalu Cloud.

### Passo 1: Configure as credenciais

É necessário criar um token de API na Magalu Cloud e armazená-lo como um segredo no GitHub. Para isso, siga os passos abaixo:

1. Acesse a [ID Magalu](https://id.magalu.com/api-keys) e crie uma API Key com as permissões necessárias.

2. No repositório do GitHub, vá em `Settings` > `Secrets` e adicione as seguintes variáveis de ambiente:

- `MGC_API_KEY`: API Key da Magalu Cloud.
- `MGC_OBJ_KEY_ID`: Object Key ID da Magalu Cloud.
- `MGC_OBJ_KEY_SECRET`: Object Key Secret da Magalu Cloud.
- `MGC_REGION`: Região da Magalu Cloud.

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
      run: terraform plan

    - name: Apply Terraform
      run: terraform apply -auto-approve
```

### Requisitos

| Name | Version |
|------|---------|
| Terraform | >= 1.0.0 |
| Provider Magalu Cloud | 0.21.1 |
| Provider Local | 2.5.1 |
| Provider Time | 0.12.0 |

### Inputs do Módulo

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster_name | Nome do Cluster | `string` | `"nataliagranato"` | no |
| cluster_description | Descrição do Cluster | `string` | `"Um cluster de Kubernetes gerenciado pela Magalu Cloud."` | no |
| kubernetes_version | Versão do Kubernetes | `string` | `"v1.28.5"` | no |
| nodepool_name | Nome do Nodepool | `string` | `"nataliagranato"` | no |
| nodepool_flavor | Flavor do Nodepool | `string` | `"cloud-k8s.gp1.small"` | no |
| nodepool_replicas | Número de Réplicas do Nodepool | `number` | `1` | no |
| timer_duration | Duração do Timer | `string` | `"15m"` | no |

### Outputs do Módulo

| Name | Description |
|------|-------------|
| cluster_id | ID do Cluster |
| cluster_name | Nome do Cluster |

Para mais detalhes, consulte o [README do módulo](https://github.com/descomplicando-terraform/granato_module-magalu-kubernetes/blob/main/README.md).
