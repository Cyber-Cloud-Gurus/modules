variable "tags" {
  type = map(string)
  description = "Tags for Resources Management"
}
variable "shortcompanyname" {
  type = string
}
variable "billing_account_name" {
  type = string
  description = "Billing Account Name for Subscription"
}
variable "billing_profile_name" {
  type = string
  description = "Billing Profile Name for Subscription"
}
variable "invoice_section_name" {
  type = string
  description = "Billing Invoice Section Name for Subscription"
}
variable "subscription_name" {
  type = list(string)
  description = "Subscription Name"
}
variable "resource_provider_name" {
  type = list(string)
  description = "List of Resources Providers Name for Subscription"  
}
