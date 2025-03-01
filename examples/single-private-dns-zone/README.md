<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | > 4.10 |

## Example

```

  private_dns_zone_name = "example.com"  //private dns zone name
  resource_group_name = "xxxxx" // resource group name
  private_dns_zone_tags = {"xxx"} // private dns zone tags, default is null!

```

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_private_dns_zone"></a> [private\_dns\_zone](#module\_private\_dns\_zone) | ../../ | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | cdornele/resource-group/azure | 1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns_zone_id"></a> [private\_dns\_zone\_id](#output\_private\_dns\_zone\_id) | The ID of the private dns zone |
| <a name="output_private_dns_zone_resouce"></a> [private\_dns\_zone\_resouce](#output\_private\_dns\_zone\_resouce) | The name of the private dns zone |
<!-- END_TF_DOCS -->