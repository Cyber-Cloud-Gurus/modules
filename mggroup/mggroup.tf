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
resource "azurerm_management_group" "landingzones-mg" {
  display_name = "MG-${var.shortcompanyname}-${var.landingzones}"
  parent_management_group_id = azurerm_management_group.region-mg.id
  depends_on = [
    azurerm_management_group.region-mg
  ]
}
resource "azurerm_management_group" "lz-bu-mg" {
  for_each = toset(var.lz_bu)
  display_name = "MG-${var.shortcompanyname}-${each.value}"
  parent_management_group_id = azurerm_management_group.landingzones-mg.id
  depends_on = [
    azurerm_management_group.landingzones-mg
  ]
}
resource "azurerm_management_group" "corp-mg" {
    for_each = toset(var.region)
    display_name = "MG-${var.shortcompanyname}-${var.corp}-${each.value}"
    parent_management_group_id = azurerm_management_group.region-mg.id
    depends_on = [
      azurerm_management_group.region-mg
    ]
  }
  resource "azurerm_management_group" "bu-mg" {
  for_each = toset(var.bu)
  display_name = "MG-${var.shortcompanyname}-${each.value}"
  parent_management_group_id = azurerm_management_group.corp-mg.id
  depends_on = [
    azurerm_management_group.region-corp-mg
  ]
}
resource "azurerm_management_group" "platform-mg" {
    for_each = toset(var.region)
    display_name = "MG-${var.shortcompanyname}-${var.platform}-${each.value}"
    parent_management_group_id = azurerm_management_group.region-mg.id
    depends_on = [
      azurerm_management_group.region-mg
    ]
  
}
resource "azurerm_management_group" "plat_bu" {
    display_name = "mg-${var.shortcompanyname}-${each.value}"
    parent_management_group_id = azurerm_management_group.platform-mg.id
    depends_on = [
      azurerm_management_group.platform-mg
    ]
  
}
resource "azurerm_management_group" "sandboxes" {
   for_each = toset(var.region)
    display_name = "MG-${var.shortcompanyname}-${var.sandboxes}-${each.value}"
    parent_management_group_id = azurerm_management_group.region-mg.id
    depends_on = [
      azurerm_management_group.region-mg
    ]
  
}