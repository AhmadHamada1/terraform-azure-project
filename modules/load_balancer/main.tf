resource "azurerm_lb" "frontend_lb" {
  name                = "frontend-lb"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = var.frontend_public_ip_id
  }
}

resource "azurerm_lb_backend_address_pool" "frontend_backend_pool" {
  name                = "frontend-backend-pool"
  loadbalancer_id     = azurerm_lb.frontend_lb.id
}

resource "azurerm_lb_probe" "frontend_probe" {
  loadbalancer_id     = azurerm_lb.frontend_lb.id
  name                = "frontend-probe"
  protocol            = "Tcp"
  port                = 80
  
  //request_path        = "/health"
  request_path        = null              # Use a valid path for your health check
  interval_in_seconds = 15                     # Interval for the probe in seconds
  number_of_probes = 3                      # How many failed probes before considering the instance unhealthy
}

resource "azurerm_lb_rule" "frontend_lb_rule" {
  name                            = "frontend-lb-rule"
  loadbalancer_id                 = azurerm_lb.frontend_lb.id  # Reference to the load balancer
  protocol                        = "Tcp"
  frontend_port                   = 80
  backend_port                    = 80
  frontend_ip_configuration_name  = azurerm_lb.frontend_lb.frontend_ip_configuration[0].name  # Use the correct name for the frontend IP config
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.frontend_backend_pool.id]  # Use plural "ids" for backend pool

  probe_id                        = azurerm_lb_probe.frontend_probe.id
}