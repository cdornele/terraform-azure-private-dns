# terraform-azure-private-dns
Azure Private DNS - Terraform Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | The name of the private DNS zone | `string` | n/a | yes |
| <a name="input_private_dns_zone_tags"></a> [private\_dns\_zone\_tags](#input\_private\_dns\_zone\_tags) | A mapping of tags to assign to the private DNS zone | `map(string)` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the private DNS zone should be created | `string` | n/a | yes |
| <a name="input_virtual_network_ids"></a> [virtual\_network\_ids](#input\_virtual\_network\_ids) | A list of virtual network IDs to link to the private DNS zone | `list(string)` | `[]` | no |
| <a name="input_vm_autoregistration_enabled"></a> [vm\_autoregistration\_enabled](#input\_vm\_autoregistration\_enabled) | Whether to enable auto-registration of virtual machines in the private DNS zone | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the private DNS zone |
| <a name="output_resource"></a> [resource](#output\_resource) | Resource of the private DNS zone |
| <a name="output_virtual_network_links"></a> [virtual\_network\_links](#output\_virtual\_network\_links) | The virtual network links to the private DNS zone |
<!-- END_TF_DOCS -->