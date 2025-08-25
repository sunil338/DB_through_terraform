variable "prefix" {
  description = "Name prefix for resources"
  type        = string
  default     = "demo"
}

variable "location" {
  description = "Azure region"
  type        = string
  # Pick a nearby supported region; Central India/West Europe/East US all work.
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
  default     = "rg-pg-demo"
}

variable "pg_admin_username" {
  description = "Postgres admin user (no @ or spaces)"
  type        = string
  default     = "pgadmin"
}

variable "pg_admin_password" {
  description = "Postgres admin password (8-128 chars; avoid spaces/quotes)"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Default database to create"
  type        = string
  default     = "appdb"
}

variable "sku_name" {
  description = "Compute SKU (cheap default)"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "client_ip" {
  description = "Your public IPv4 address to allow through the firewall"
  type        = string
}

