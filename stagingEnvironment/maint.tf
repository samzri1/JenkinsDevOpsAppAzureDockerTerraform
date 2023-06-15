terraform {
   required_version = ">= 0.12"
   required_providers {
      azurerm = ">3.0"
   }
}

provider "azurerm" {
    features {
      
    }
}

module "webserverModule" {
  source = "../webserverModule "
  Resource_Group_name = "obab_Staging_"
  location = "francecentral"
  instance_size = "Standard_B2s"
  environment = "Staging"
}
