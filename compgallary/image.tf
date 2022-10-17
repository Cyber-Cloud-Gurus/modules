data "azurerm_storage_container" "saconatiner" {
  name                 = var.containername
  storage_account_name = var.storaccname
}
resource "azurerm_image" "vm-image" {
  name                = var.vmimagename
  location            = var.location
  resource_group_name = var.rgname
  hyper_v_generation  = "V2"
  tags                = var.tags

  os_disk {
    os_type  = "Windows"
    os_state = "Generalized"
    blob_uri = "https://ccstorage2054632676.blob.core.windows.net/vhds/Win10.vhd"
    size_gb  = 200
  }
  depends_on = [data.azurerm_storage_container.saconatiner]

}