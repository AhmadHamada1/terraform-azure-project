# Fetch information about the Key Vault
data "azurerm_key_vault" "example" {
  name                = "myKeyVaultNa"
  resource_group_name = "myResourceGroup"
}

# Fetch a specific secret from the Key Vault
data "azurerm_key_vault_secret" "db_password" {
  name         = "DBPassword"
  key_vault_id = data.azurerm_key_vault.example.id
}

# Output the secret value (you can use this in other resources if needed)
output "db_password" {
  value = data.azurerm_key_vault_secret.db_password.value
}