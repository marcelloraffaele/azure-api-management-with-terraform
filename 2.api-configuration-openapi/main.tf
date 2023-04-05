
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_api_management" "apim" {
  name                = var.apim_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_api_management_api" "petstore-api" {
  name                = "petstore-api"
  resource_group_name = data.azurerm_resource_group.rg.name
  api_management_name = data.azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Petstore API"
  path                = "petstore"
  protocols           = ["https"]
  subscription_required = false
  service_url         = "https://petstore.swagger.io/v2"

  import {
    content_format = "swagger-link-json"
    content_value  = "https://petstore.swagger.io/v2/swagger.json"
  }
}

