output "resource_group_name" {
  value = azurerm_resource_group.samwebserver.name
}

output "The_subnet_ID" {
 value = azurerm_subnet.samwebserver-subnet.id
}

output "The_vnet_ID" {
 value = azurerm_virtual_network.samwebserver-net.id
}

output "The_websrever_Private_ip" {
   value = azurerm_linux_virtual_machine.samapp.private_ip_address
}

output "The_samwebserver_Public_ip" {
   value = azurerm_linux_virtual_machine.samapp.public_ip_address
}
