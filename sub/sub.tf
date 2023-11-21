
/*#Locate the existing custom/golden image
data "azurerm_image" "vmimagename" {
  name                = var.vmimagename
  resource_group_name = var.rgname
}*/
data "azurerm_network_interface" "vm-nic" {
  name                = var.nicname
  resource_group_name = var.rgname
}
data "azurerm_log_analytics_workspace" "laws" {
  name                = var.lawsname
  resource_group_name = var.rgname
}
/*output "image_id" {
  value = var.imageid
}*/

resource "azurerm_virtual_machine" "vm" {
  name                             = var.vmname
  location                         = var.location
  resource_group_name              = var.rgname
  network_interface_ids            = [data.azurerm_network_interface.vm-nic.id]
  vm_size                          = var.vmsize
  zones                            = var.zones
  delete_data_disks_on_termination = true

  /*storage_image_reference {
    id = data.azurerm_image.vmimagename.id
  }*/
 storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  storage_os_disk {
    name              = var.storosdisk
    caching           = var.storcaching
    create_option     = "FromImage"
    managed_disk_type = var.storacctype
  }

  os_profile {
    computer_name  = var.computername
    admin_username = var.admacc
    admin_password = var.admpass
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  depends_on = [data.azurerm_network_interface.vm-nic]
}

#Managed Disk 
resource "azurerm_managed_disk" "managed_disk" {
  name                 = var.md_name1
  location             = var.location
  resource_group_name  = var.rgname
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  zone                 = var.zone
}

resource "azurerm_virtual_machine_data_disk_attachment" "MD_attach" {
  managed_disk_id    = azurerm_managed_disk.managed_disk.id
  virtual_machine_id = azurerm_virtual_machine.vm.id
  lun                = var.lun
  caching            = var.caching
}
#Agent for Windows
resource "azurerm_virtual_machine_extension" "vm-exten" {
  name                       = "MMAextension"
  virtual_machine_id         = azurerm_virtual_machine.vm.id
  publisher                  = "Microsoft.EnterpriseCloud.Monitoring"
  type                       = "MicrosoftMonitoringAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
      "workspaceId" : "${data.azurerm_log_analytics_workspace.laws.workspace_id}"
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      "workspaceKey" : "${data.azurerm_log_analytics_workspace.laws.primary_shared_key}"
    }
  PROTECTED_SETTINGS
}

# Dependency Agent for Windows
resource "azurerm_virtual_machine_extension" "da" {
  name                       = "DAExtension"
  virtual_machine_id         = azurerm_virtual_machine.vm.id
  publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                       = "DependencyAgentWindows"
  type_handler_version       = "9.5"
  auto_upgrade_minor_version = true

}
