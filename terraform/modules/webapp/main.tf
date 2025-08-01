# Creates the resource group for web app resources if it doesn't exist
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Creates an Azure App Service Plan
resource "azurerm_service_plan" "asp" {
  name                = "${var.prefix}-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type                = "Linux" # Or "Windows"
  sku_name               = "F1"
}

# Creates an Azure App Service (Web App)
#resource "azurerm_app_service" "app" {
#  name                = "${var.prefix}-app"
#  location            = azurerm_resource_group.rg.location
#  resource_group_name = azurerm_resource_group.rg.name
#  app_service_plan_id = azurerm_app_service_plan.asp.id
#}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.prefix}-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {}
}