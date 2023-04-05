output "resource_group_id" {
  value = data.azurerm_resource_group.rg.id
}
output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}

output "api_management_id" {
  value = data.azurerm_api_management.apim.id
}