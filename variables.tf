#--------------------------------------------*--------------------------------------------
# Module: Azure Private DNS - Variables
#--------------------------------------------*--------------------------------------------

variable "private_dns_zone_name" {
  description = "The name of the private DNS zone"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the private DNS zone should be created"
  type        = string
}

variable "private_dns_zone_tags" {
  description = "A mapping of tags to assign to the private DNS zone"
  type        = map(string)
  default    = {}
}

variable "virtual_network_ids" {
  description = "A list of virtual network IDs to link to the private DNS zone"
  type        = list(string)
  default    = []
}

variable "vm_autoregistration_enabled" {
  description = "Whether to enable auto-registration of virtual machines in the private DNS zone"
  type        = bool
  default    = false
}

# end
#--------------------------------------------*--------------------------------------------