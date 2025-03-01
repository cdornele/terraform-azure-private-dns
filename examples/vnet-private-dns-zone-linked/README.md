<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | > 4.10 |

## Example

```

  private_dns_zone_name = "example.com"  //private dns zone name is required!
  resource_group_name = "xxxxx" // resource group name is required!
   virtual_network_ids = ["/xxxx/xxxx/xxxx] // virtual network ids, default is null!
  private_dns_zone_tags = {"xxx"} // private dns zone tags, default is null!

```

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network"></a> [network](#module\_network) | cdornele/network-spoke/azure | 2.0.1 |
| <a name="module_private_dns_zone"></a> [private\_dns\_zone](#module\_private\_dns\_zone) | ../../ | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | cdornele/resource-group/azure | 1.0.0 |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | The ID of the virtual network |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | The name of the virtual network |
| <a name="output_private_dns_zone_id"></a> [private\_dns\_zone\_id](#output\_private\_dns\_zone\_id) | The ID of the private dns zone |
| <a name="output_private_dns_zone_resouce"></a> [private\_dns\_zone\_resouce](#output\_private\_dns\_zone\_resouce) | The name of the private dns zone |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the subnet |
| <a name="output_virtual_network_links"></a> [virtual\_network\_links](#output\_virtual\_network\_links) | The virtual network links to the private DNS zone |
<!-- END_TF_DOCS -->