
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_api_management" "apim" {
  name                = var.apim_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_api_management_api" "httpbin-api" {
  name                = "httpbin-api"
  resource_group_name = data.azurerm_resource_group.rg.name
  api_management_name = data.azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Httpbin API"
  path                = "httpbin"
  protocols           = ["https"]
  subscription_required = false
}

# OPERATION GET
resource "azurerm_api_management_api_operation" "httpbin-api-get" {
  operation_id        = "httpbin-get"
  api_name            = azurerm_api_management_api.httpbin-api.name
  api_management_name = azurerm_api_management_api.httpbin-api.api_management_name
  resource_group_name = azurerm_api_management_api.httpbin-api.resource_group_name
  display_name        = "Get Operation"
  method              = "GET"
  url_template        = "/get"
  description         = "bla bla bla..."

  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation_policy" "httpbin-api-get-policy" {
  api_name            = azurerm_api_management_api.httpbin-api.name
  api_management_name = azurerm_api_management_api.httpbin-api.api_management_name
  resource_group_name = azurerm_api_management_api.httpbin-api.resource_group_name
  operation_id        = azurerm_api_management_api_operation.httpbin-api-get.operation_id

  xml_content = <<XML
<policies>
  <inbound>
    <base />
    <set-backend-service base-url="https://httpbin.org/" />
    <rewrite-uri template="/get" copy-unmatched-params="true" />
  </inbound>
</policies>
XML

}

# OPERATION UUID
resource "azurerm_api_management_api_operation" "httpbin-api-uuid" {
  operation_id        = "httpbin-uuid"
  api_name            = azurerm_api_management_api.httpbin-api.name
  api_management_name = azurerm_api_management_api.httpbin-api.api_management_name
  resource_group_name = azurerm_api_management_api.httpbin-api.resource_group_name
  display_name        = "uuid Operation"
  method              = "GET"
  url_template        = "/uuid"
  description         = "bla bla bla..."

  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation_policy" "httpbin-api-uuid-policy" {
  api_name            = azurerm_api_management_api.httpbin-api.name
  api_management_name = azurerm_api_management_api.httpbin-api.api_management_name
  resource_group_name = azurerm_api_management_api.httpbin-api.resource_group_name
  operation_id        = azurerm_api_management_api_operation.httpbin-api-uuid.operation_id

  xml_content = <<XML
<policies>
  <inbound>
    <base />
    <set-backend-service base-url="https://httpbin.org/" />
    <rewrite-uri template="/uuid" copy-unmatched-params="true" />
  </inbound>
</policies>
XML

}

# OPERATION error
resource "azurerm_api_management_api_operation" "httpbin-api-error" {
  operation_id        = "httpbin-error"
  api_name            = azurerm_api_management_api.httpbin-api.name
  api_management_name = azurerm_api_management_api.httpbin-api.api_management_name
  resource_group_name = azurerm_api_management_api.httpbin-api.resource_group_name
  display_name        = "error Operation"
  method              = "GET"
  url_template        = "/error"
  description         = "Error Example"

  response {
    status_code = 500
    description = "This operation can answer with an error"
  }
}

resource "azurerm_api_management_api_operation_policy" "httpbin-api-error-policy" {
  api_name            = azurerm_api_management_api.httpbin-api.name
  api_management_name = azurerm_api_management_api.httpbin-api.api_management_name
  resource_group_name = azurerm_api_management_api.httpbin-api.resource_group_name
  operation_id        = azurerm_api_management_api_operation.httpbin-api-error.operation_id

  xml_content = <<XML
<policies>
  <inbound>
    <base />
    <set-backend-service base-url="https://httpbin.org/" />
    <rewrite-uri template="/status/500" copy-unmatched-params="true" />
  </inbound>
</policies>
XML

}