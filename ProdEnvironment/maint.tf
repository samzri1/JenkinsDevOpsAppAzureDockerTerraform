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
  source = "github.com/obabaldbiyat/JenkinsDevOpsAppAzureDockerTerraform/webserverModule"
  Resource_Group_name = "prod_"
  location = "westeurope"
}
