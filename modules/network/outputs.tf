// modules/network/outputs.tf
output "frontend_subnet_id" {
  value = azurerm_subnet.frontend_subnet.id
}
