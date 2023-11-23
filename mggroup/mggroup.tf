data "azurerm_subscription" "current" {
}

resource "azurerm_management_group" "parent-ccg" {
  display_name =  "MG-${var.CompanyManagementGroupName}"
}
resource "azurerm_management_group" "region-mg" {
  for_each = toset(var.region)
  display_name = "MG-${var.shortcompanyname}-${each.value}"
  parent_management_group_id = azurerm_management_group.parent-ccg.id
  depends_on = [
    azurerm_management_group.parent-ccg
  ]
}

resource "azurerm_management_group" "region-bu" {
  for_each = { for entry in var.region_bu : entry.reg => entry }
  display_name = "MG-${var.shortcompanyname}-${each.value.reg}-${each.key}"
  parent_management_group_id = azurerm_management_group.region-mg[each.key].id
  depends_on = [
    azurerm_management_group.region-mg
  ]
}
/*resource "azurerm_management_group" "hr-mg" {
  for_each = toset(var.region)
  display_name = "MG-${var.shortcompanyname}-${each.value}-${var.hr}"
  parent_management_group_id = azurerm_management_group.region-mg[each.key].id
  depends_on = [
    azurerm_management_group.region-mg
  ]
}
resource "azurerm_management_group" "landingzones-mg" {
  display_name = "MG-${var.shortcompanyname}-${var.landingzones}"
  parent_management_group_id = azurerm_management_group.parent-ccg.id
  depends_on = [
    azurerm_management_group.parent-ccg
  ]
}
resource "azurerm_management_group" "landingzones-bu" {
  for_each = toset(var.rlandingzones-bu)
  display_name = "MG-${var.shortcompanyname}-${each.value}-${var.landingzones}"
  parent_management_group_id = azurerm_management_group.parent-ccg.id
  depends_on = [
    azurerm_management_group.parent-ccg
  ]
}
resource "azurerm_management_group" "corp" {
    display_name = "MG-${var.shortcompanyname}-${var.corp}"
    parent_management_group_id = azurerm_management_group.landingzones-mg.id
    depends_on = [
      azurerm_management_group.landingzones-mg
    ]
  
}
resource "azurerm_management_group" "it" {
    display_name = "MG-${var.shortcompanyname}-${var.it}"
    parent_management_group_id = azurerm_management_group.landingzones-mg.id
    depends_on = [
      azurerm_management_group.landingzones-mg
    ]
  
}
resource "azurerm_management_group" "online" {
    display_name = "MG-${var.shortcompanyname}-${var.online}"
    parent_management_group_id = azurerm_management_group.landingzones-mg.id
    depends_on = [
      azurerm_management_group.landingzones-mg
    ]
}
resource "azurerm_management_group" "platform" {
    display_name = "MG-${var.shortcompanyname}-${var.platform}"
    parent_management_group_id = azurerm_management_group.parent-ccg.id
    depends_on = [
      azurerm_management_group.parent-ccg
    ]
  
}
resource "azurerm_management_group" "connectivity" {
    display_name = "mg-${var.shortcompanyname}-${var.connectivity}"
    parent_management_group_id = azurerm_management_group.platform.id
    depends_on = [
      azurerm_management_group.platform
    ]
  
}
resource "azurerm_management_group" "identity" {
    display_name = "MG-${var.shortcompanyname}-${var.identity}"
    parent_management_group_id = azurerm_management_group.platform.id
    depends_on = [
      azurerm_management_group.platform
    ]
}
resource "azurerm_management_group" "management" {
    display_name = "MG-${var.shortcompanyname}-${var.management}"
    parent_management_group_id = azurerm_management_group.platform.id
    depends_on = [
      azurerm_management_group.platform
    ]
  
}
resource "azurerm_management_group" "sandboxes" {
    display_name = "MG-${var.shortcompanyname}-${var.sandboxes}"
    parent_management_group_id = azurerm_management_group.parent-ccg.id
    depends_on = [
      azurerm_management_group.parent-ccg
    ]
  
}*/