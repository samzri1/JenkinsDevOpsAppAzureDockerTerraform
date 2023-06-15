output "resource_group_name" {
  value = azurerm_resource_group.obabwebserver.name
}

output "The_subnet_ID" {
 value = azurerm_subnet.obabwebserver-subnet.id
}

output "The_vnet_ID" {
 value = azurerm_virtual_network.obabwebserver-net.id
}

output "The_websrever_Private_ip" {
   value = azurerm_linux_virtual_machine.obabnginx.private_ip_address
}

output "The_obabwebserver_Public_ip" {
   value = azurerm_linux_virtual_machine.obabnginx.public_ip_address
}
