
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_api_management" "apim" {
  name                = var.apim_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_api_management_policy" "apim-policy" {
  api_management_id = data.azurerm_api_management.apim.id
  xml_content       = file("policy.xml")
}