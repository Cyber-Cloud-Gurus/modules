data "azurerm_resource_group" "rg-name" {
  name = var.rgname
}
resource "azurerm_storage_account" "storacc" {
  name                            = var.storaccname
  resource_group_name             = var.rgname
  location                        = var.location
  account_tier                    = var.storetier
  account_replication_type        = var.storaccrepltype
  enable_https_traffic_only       = var.storacchttps
  allow_nested_items_to_be_public = var.storaccpublic
  tags                            = var.tags
  #  network_rules {
  #   default_action             = var.nrda
  #    ip_rules                   = var.nriprule
  #  virtual_network_subnet_ids = var.subnetid

  depends_on = [data.azurerm_resource_group.rg-name]

}
resource "azurerm_storage_container" "ccg-storacc-container" {
  name                  = var.containername
  storage_account_name  = var.storaccname
  container_access_type = var.containertype

  depends_on = [data.azurerm_resource_group.rg-name]
}

