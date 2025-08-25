# Unique suffix so server name is globally unique
resource "random_string" "suffix" {
  length  = 5
  upper   = false
  special = false
}

# Resource Group
resource "azurerm_postgresql_flexible_server" "pg" {
  name                = "${var.prefix}-pg-${random_string.suffix.result}"
  resource_group_name = var.resource_group_name
  location            = var.location
  ...
}


# PostgreSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "pg" {
  name                = "${var.prefix}-pg-${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku_name  = "B_Standard_B1ms"             # Correct SKU format for Flexible Server
  version   = "15"                          # Postgres major version
  storage_mb               = 32768          # 32 GB
  backup_retention_days    = 7
  public_network_access_enabled = true

  administrator_login    = var.pg_admin_username
  administrator_password = var.pg_admin_password

  # Auto-grow storage if needed
  storage_tier = "P4" # optional; safe default tier for 32GB
}

# Allow ONLY your public IP to connect
resource "azurerm_postgresql_flexible_server_firewall_rule" "me" {
  name                = "allow-my-ip"
  server_id           = azurerm_postgresql_flexible_server.pg.id
  start_ip_address    = var.client_ip
  end_ip_address      = var.client_ip
}

# Create an initial database
resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.pg.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
