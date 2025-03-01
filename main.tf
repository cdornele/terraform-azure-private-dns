#--------------------------------------------*--------------------------------------------
# Module: Azure Private DNS - Main
#--------------------------------------------*--------------------------------------------

resource "azurerm_private_dns_zone" "this" {
  name                          = var.private_dns_zone_name
  resource_group_name  =  var.resource_group_name
  tags                           =  var.private_dns_zone_tags 
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  depends_on                  = [
                                          azurerm_private_dns_zone.this
                                        ]
  count                            = length(var.virtual_network_ids)
  name                            = format("%s-link", reverse(split("/", var.virtual_network_ids[count.index]))[0])
  resource_group_name    = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id         = var.virtual_network_ids[count.index]
  registration_enabled      = var.vm_autoregistration_enabled
  tags                             = var.private_dns_zone_tags
}


# end
#--------------------------------------------*--------------------------------------------