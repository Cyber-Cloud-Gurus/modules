data "azurerm_subscription" "current" {
}

resource "azurerm_management_group" "parent" {
  display_name = var.parent
}

resource "azurerm_management_group" "child" {
  display_name               = va.child
  parent_management_group_id = azurerm_management_group.parent.id

  }
 