#--------------------------------------------*--------------------------------------------
# Module: Azure Private DNS - Output
#--------------------------------------------*--------------------------------------------

output "id" {
  description = "The ID of the private DNS zone"
  value       = azurerm_private_dns_zone.this.id
}

output "resource" {
  description = "Resource of the private DNS zone"
  value       = azurerm_private_dns_zone.this
}

output "virtual_network_links" {
  description = "The virtual network links to the private DNS zone"
  value       = azurerm_private_dns_zone_virtual_network_link.this
}

# end
#--------------------------------------------*--------------------------------------------