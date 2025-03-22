terraform {
  required_providers {
    mgc = {
      source  = "magalucloud/mgc"
      version = "~> 0.27.0" # Permite atualizações dentro da versão 0.27.x
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5.0" # Permite atualizações dentro da versão 2.5.x
    }
  }

  backend "s3" {
    bucket   = "granato-tf"
    key      = "kubernetes/terraform.tfstate"
    region   = "br-se1"
    endpoint = "https://br-se1.magaluobjects.com/granato-tf"
  }
}
