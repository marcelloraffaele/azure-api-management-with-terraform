variable "region" {
  description = "region"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  default = "sandbox-apim-rg"
}

variable "apim_name" {
  type        = string
  default = "sandbox-123456"
}

variable "apim_publisher_name" {
  type        = string
  default = "test"
}

variable "apim_publisher_email" {
  type        = string
  default = "test@example.com"
}

variable "apim_sku_name" {
  type        = string
  default = "Consumption_0"
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    project     = "sandbox-apim",
    environment = "sandbox"
  }
}


