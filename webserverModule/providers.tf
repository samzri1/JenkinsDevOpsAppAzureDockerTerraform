terraform {
   required_version = ">= 0.12"
   required_providers {
      azurerm = ">3.0"
   }
}

provider "azurerm" {
   subscription_id = "393e3de3-0900-4b72-8f1b-fb3b1d6b97f1"
   client_id = "2ac719ef-3f8b-45ad-b133-8d66e0919476"
   client_secret = "9rf8Q~iPU1Ur5fvNpXk.Z1kl99-27F16mygVNcLG"
   tenant_id = "7349d3b2-951f-41be-877e-d8ccd9f3e73c"
   skip_provider_registration = true
   features {}
}
