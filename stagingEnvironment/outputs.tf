output "resource_group_name" {
  value = module.webserverModule.resource_group_name
}

output "The_subnet_ID" {
 value = module.webserverModule.The_subnet_ID
}

output "The_vnet_ID" {
 value = module.webserverModule.The_vnet_ID
}

output "The_websrever_Private_ip" {
   value = module.webserverModule.The_websrever_Private_ip
}

output "The_obabwebserver_Public_ip" {
   value = module.webserverModule.The_obabwebserver_Public_ip
}
