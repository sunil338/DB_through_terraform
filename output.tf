# Helpful bits
output "server_name" {
  value = azurerm_postgresql_flexible_server.pg.name
}

output "server_fqdn" {
  value = azurerm_postgresql_flexible_server.pg.fqdn
}

output "database_name" {
  value = azurerm_postgresql_flexible_server_database.db.name
}

# Full connection string (includes password) – prints in CLI.
# NOTE: This will also be stored in terraform.tfstate. Do NOT commit that file.
output "connection_string" {
  value = format(
    "postgresql://%s:%s@%s:5432/%s?sslmode=require",
    var.pg_admin_username,
    var.pg_admin_password,
    azurerm_postgresql_flexible_server.pg.fqdn,
    azurerm_postgresql_flexible_server_database.db.name
  )
}

# Safer psql command (no password echoed if you edit it to read from env)
output "psql_command_example" {
  value = format(
    "PGPASSWORD=<your-password> psql -h %s -U %s -d %s -p 5432",
    azurerm_postgresql_flexible_server.pg.fqdn,
    var.pg_admin_username,
    azurerm_postgresql_flexible_server_database.db.name
  )
}

