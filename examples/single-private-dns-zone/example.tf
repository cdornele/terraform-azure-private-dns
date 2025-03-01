#--------------------------------------------*--------------------------------------------
# Single Example: Azure Private DNS Zone
#--------------------------------------------*--------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "> 4.10"
    }
  }
}

provider "azurerm" {
  features {}
}

# module call

module "resource_group" {
  source  = "cdornele/resource-group/azure"
  version = "1.0.0"
  stack     = "test"
  prefixes  = ["az","eus2"]
  suffixes  = ["t","01"]
  location  = "eastus2"
  tags      = {
    "environement" = "test"
    "owner"        = "example"
    "project"      =  "example"
    "customer"     = "example"
  }
}

module "private_dns_zone" {
  source = "../../"
  private_dns_zone_name = "example.com"
  resource_group_name = module.resource_group.name
  private_dns_zone_tags = {
    "environement" = "test"
    "owner"        = "example"
    "project"      =  "example"
    "customer"     = "example"
  }
}