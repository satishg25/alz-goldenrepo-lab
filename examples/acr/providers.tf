terraform {
  required_version = ">= 1.7.0, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Configure the approved remote backend in the landing repository.
  # backend "azurerm" {}
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
