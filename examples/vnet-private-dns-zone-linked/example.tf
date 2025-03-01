#--------------------------------------------*--------------------------------------------
# Single Example: Azure Private DNS Zone -Virtual Network Link
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

module "network" {
  source  = "cdornele/network-spoke/azure"
  version = "2.0.1"
  global_settings = {
    name = "example"
    suffixes = ["t", "01"]
  }
  settings = {
     address_space       = ["192.168.0.0/24"]
     subnet_settings     = {
        subnets = {
          example= {
            name = "exemple"
            suffixes = ["t", "01"]
            address_prefixes = ["192.168.0.0/28"]
            nsg_key = "example-nsg"
            rts_key = "example-rts"
         }
       }
    }
    network_security_group_settings = {
      empty_nsg={}
      example-nsg={
            name = "example"
            suffixes = ["t", "01"]
            rules    = [
              {
                name                       = "allow-http-inbound",
                priority                   = "100"
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "80"
                source_address_prefix      = "*"
                destination_address_prefix = "*"
                description                = "Allow inbound HTTP traffic example"
              }
            ]
      }
    }
    route_tables_settings = {
      example-rts={
        is_Enabled = false
        name     ="example"
        suffixes = ["t", "01"]
      }
    }
  }
  resource_group = module.resource_group.name
  location = module.resource_group.location
  tags = module.resource_group.tags
}

module "private_dns_zone" {
  source = "../../"
  private_dns_zone_name = "example.com"
  resource_group_name = module.resource_group.name
  virtual_network_ids = [module.network.virtual_network_id]
  private_dns_zone_tags = {
    "environement" = "test"
    "owner"        = "example"
    "project"      =  "example"
    "customer"     = "example"
  }
}

# output

output "network_id" {
  description = "The ID of the virtual network"
  value = module.network.virtual_network_id
}

output "network_name" {
  description = "The name of the virtual network"
  value = module.network.virtual_network_name
}

output "subnet_id" {
  description = "The ID of the subnet"
  value = module.network.subnets[0].example.subnet_id
}

output "private_dns_zone_resouce" {
  description = "The name of the private dns zone"
  value = module.private_dns_zone.resource
}

output "private_dns_zone_id" {
  description = "The ID of the private dns zone"
  value = module.private_dns_zone.id
}

output "virtual_network_links" {
  description = "The virtual network links to the private DNS zone"
  value = module.private_dns_zone.virtual_network_links
}

# end
#--------------------------------------------*--------------------------------------------