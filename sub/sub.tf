data "azurerm_billing_mca_account_scope" "ccg_billing" {
  billing_account_name = var.billing_account_name
  billing_profile_name = var.billing_profile_name
  invoice_section_name = var.invoice_section_name
}

resource "azurerm_subscription" "ccg_subs" {
  for_each = toset(var.subscription_name)
  subscription_name = "Sub-${var.shortcompanyname}-${each.value}"
  billing_scope_id  = data.azurerm_billing_mca_account_scope.cg_billing.id
}

resource "azurerm_resource_provider_registration" "resource_provider_name" {
  name = var.resource_provider_name  
}

/*data "azurerm_management_group" "example" {
  name = var.management_group
}

data "azurerm_subscription" "example" {
  subscription_id = "12345678-1234-1234-1234-123456789012"
}

resource "azurerm_management_group_subscription_association" "example" {
  management_group_id = data.azurerm_management_group.example.id
  subscription_id     = data.azurerm_subscription.example.id
}*/