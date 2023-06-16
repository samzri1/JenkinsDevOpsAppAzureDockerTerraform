resource "azurerm_virtual_network" "obabwebserver-net" {
  name                = "obabwebserver-net"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.obabwebserver.name
}

resource "azurerm_subnet" "obabwebserver-subnet" {
  name                 = "subnet01"
  resource_group_name  = azurerm_resource_group.obabwebserver.name
  virtual_network_name = azurerm_virtual_network.obabwebserver-net.name
  address_prefixes       = ["10.0.1.0/24"]

  private_link_service_network_policies_enabled = false
}
