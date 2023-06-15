resource "azurerm_resource_group" "obabwebserver" {
  name = "${var.Resource_Group_name}NGINX"
  location = "${var.location}"
}

###########################

#resource "azurerm_resource_group" "obabwebserver" {
#   name = "obabnginx-server"
#   location = var.location
#}

resource "azurerm_network_security_group" "allowedports" {
   name = "allowedports"
   resource_group_name = azurerm_resource_group.obabwebserver.name
   location = var.location
  
   security_rule {
       name = "http"
       priority = 100
       direction = "Inbound"
       access = "Allow"
       protocol = "Tcp"
       source_port_range = "*"
       destination_port_range = "80"
       source_address_prefix = "*"
       destination_address_prefix = "*"
   }

   security_rule {
       name = "https"
       priority = 200
       direction = "Inbound"
       access = "Allow"
       protocol = "Tcp"
       source_port_range = "*"
       destination_port_range = "443"
       source_address_prefix = "*"
       destination_address_prefix = "*"
   }

   security_rule {
       name = "ssh"
       priority = 300
       direction = "Inbound"
       access = "Allow"
       protocol = "Tcp"
       source_port_range = "*"
       destination_port_range = "22"
       source_address_prefix = "*"
       destination_address_prefix = "*"
   }
}

resource "azurerm_public_ip" "obabwebserver_public_ip" {
   name = "obabwebserver_public_ip"
   location = var.location
   resource_group_name = azurerm_resource_group.obabwebserver.name
   allocation_method = "Dynamic"

   tags = {
       environment = var.environment
       costcenter = "it"
   }

   depends_on = [azurerm_resource_group.obabwebserver]
}

resource "azurerm_network_interface" "obabwebserver" {
   name = "nginx-interface"
   location = var.location
   resource_group_name = azurerm_resource_group.obabwebserver.name

   ip_configuration {
       name = "internal"
       private_ip_address_allocation = "Dynamic"
       subnet_id = azurerm_subnet.obabwebserver-subnet.id
       public_ip_address_id = azurerm_public_ip.obabwebserver_public_ip.id
   }

   depends_on = [azurerm_resource_group.obabwebserver]
}

resource "azurerm_linux_virtual_machine" "obabnginx" {
   size = var.instance_size
   name = "nginx-obabwebserver"
   resource_group_name = azurerm_resource_group.obabwebserver.name
   location = var.location
   custom_data = base64encode(file("../webserverModule/cloud-init.txt"))
   network_interface_ids = [
       azurerm_network_interface.obabwebserver.id,
   ]

   source_image_reference {
       publisher = "Canonical"
       offer = "UbuntuServer"
       sku = "18.04-LTS"
       version = "latest"
   }

   computer_name = "obabnginx"
   admin_username = "obabadmin"
   admin_password = "Azertyuiop1234"
   disable_password_authentication = false

   os_disk {
       name = "nginxdisk01"
       caching = "ReadWrite"
       #create_option = "FromImage"
       storage_account_type = "Standard_LRS"
   }

   tags = {
       environment = var.environment
       costcenter = "it"
   }

   depends_on = [azurerm_resource_group.obabwebserver]
}
