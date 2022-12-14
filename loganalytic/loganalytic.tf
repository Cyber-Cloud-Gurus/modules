data "azurerm_resource_group" "rg-name" {
  name = var.rgname
}
resource "azurerm_log_analytics_workspace" "laws" {
  name                = var.lawsname
  location            = var.location
  resource_group_name = var.rgname
  sku                 = var.lawssku
  retention_in_days   = var.lawsreten
  internet_ingestion_enabled = var.internet_ingestion_enabled
  internet_query_enabled     = var.internet_query_enabled 

  depends_on = [data.azurerm_resource_group.rg-name]
}
resource "azurerm_log_analytics_solution" "law-soluttion-ci" {
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.rgname
  workspace_resource_id = azurerm_log_analytics_workspace.laws.id
  workspace_name        = azurerm_log_analytics_workspace.laws.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
resource "azurerm_log_analytics_solution" "law-soluttion-nm" {
  solution_name         = "NetworkMonitoring"
  location              = var.location
  resource_group_name   = var.rgname
  workspace_resource_id = azurerm_log_analytics_workspace.laws.id
  workspace_name        = azurerm_log_analytics_workspace.laws.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/NetworkMonitoring"
  }
}