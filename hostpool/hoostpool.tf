data "azurerm_resource_group" "rg-name" {
  name = var.rgname
}
resource "azurerm_virtual_desktop_host_pool" "hostpool" {
  location            = var.location
  resource_group_name = var.rgname

  name                     = var.host_pool_name
  friendly_name            = var.friendly_name
  validate_environment     = var.validate_environment
  start_vm_on_connect      = true
  custom_rdp_properties    = "audiocapturemode:i:1;audiomode:i:0;"
  description              = "Acceptance Test: A pooled host pool - pooleddepthfirst"
  type                     = "Pooled"
  maximum_sessions_allowed = var.maximum_sessions_allowed
  load_balancer_type       = var.load_balancer_type
  scheduled_agent_updates {
    enabled = true
    schedule {
      day_of_week = "Saturday"
      hour_of_day = 2
    }
  }
 depends_on = [data.azurerm_resource_group.rg-name]
}