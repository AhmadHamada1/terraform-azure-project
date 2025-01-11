module "load_balancer" {
  source = "../load_balancer"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  frontend_ip_name           = var.frontend_ip_name
  frontend_ip_public_ip_name = var.frontend_ip_public_ip_name
  frontend_ip_public_ip_id   = var.frontend_ip_public_ip_id
  frontend_subnet_address    = var.frontend_subnet_address
}

resource "azurerm_linux_virtual_machine_scale_set" "frontend_vmss" {
  name                = var.frontend_vmss_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard_B1ms"  # VM size
  instances           = var.vmss_instance_count  # Number of instances
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("/home/Hamada/.ssh/new_azure_key.pub") # Path to SSH public key
   } 

  # Upgrade policy
  upgrade_mode = "Automatic"

  # Source image for the VMs (Ubuntu 19.04 in this example)
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "19_04-gen2"
    version   = "19.04.201908230"
  }

  # OS disk configuration
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Network interface configuration
  network_interface {
    name    = "frontend-network-profile"
    primary = true

    ip_configuration {
      name                                   = "frontend-ip-config"
      primary                                = true
      subnet_id                              = var.frontend_subnet_id
      load_balancer_backend_address_pool_ids = [module.load_balancer.frontend_backend_pool_id]
    }
  }

  # Tags
  tags = {
    Environment = "Production"
  }
}