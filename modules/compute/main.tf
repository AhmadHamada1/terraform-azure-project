resource "azurerm_linux_virtual_machine" "frontend_vm" {
  name                = "frontend-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  // admin_password      = var.admin_password
  disable_password_authentication = true  #  password authentication is disabled
  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key # Path to SSH public key
   } 
  network_interface_ids = [azurerm_network_interface.frontend_nic.id]
  os_disk {
    name              = "frontend-os-disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "19_04-gen2"
    version   = "19.04.201908230"
  }

}

resource "azurerm_network_interface" "frontend_nic" {
  name                = "frontend-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "frontend-ip-config"
    subnet_id                     = var.frontend_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
