resource "azurerm_virtual_network" "samwebserver-net" {
  name                = "samwebserver-net"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.samwebserver.name
}

resource "azurerm_subnet" "samwebserver-subnet" {
  name                 = "subnet01"
  resource_group_name  = azurerm_resource_group.samwebserver.name
  virtual_network_name = azurerm_virtual_network.samwebserver-net.name
  address_prefixes       = ["10.0.1.0/24"]

  private_link_service_network_policies_enabled = false
}
