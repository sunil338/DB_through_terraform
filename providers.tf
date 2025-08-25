terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "34a1c0d5-ab81-462c-89db-795e1572cd70"
  tenant_id       = "7e1b4521-93b6-473d-8e77-cf32c35bff05"
  client_id       = "86ddbca0-a225-421b-ad68-5de8e0e23cb9"
  client_secret   = "1ol8Q~N_Bb~o~T2-nHJwlBH2GuL6nAdAnpIj2aFg"
}
