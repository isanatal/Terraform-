# providers.tf
# Configuración del proveedor de Azure (azurerm) para Terraform.
# Corresponde a: "10 Habilitar el proveedor de redes de Microsoft.mp4"
#                "12 Configuracion de tfvars y providers.mp4"

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}
