data "azurerm_subscription" "current" {
}

resource "azurerm_management_group" "parent" {
  display_name = var.parent1
}

resource "azurerm_management_group" "child" {
  display_name               = va.child1
  parent_management_group_id = azurerm_management_group.parent.id

  }
 