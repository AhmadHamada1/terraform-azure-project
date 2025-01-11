output "vmss_name" {
  description = "The name of the VMSS"
  value       = azurerm_linux_virtual_machine_scale_set.frontend_vmss.name
}
