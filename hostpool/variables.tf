variable "rgname" {
  type        = string
  description = "Resource Group Name"
  default     = "rg1"
}
variable "location" {
  type        = string
  description = "The location for the deploymnet"
  default     = "West Us"
}
variable "tags" {
  type = map(string)
}
variable "host_pool_name" {
  type        = string
  description = "Azure Virtual Desktop Host Pool"
}
variable "friendly_name" {
  type        = string
  description = "Azure Virtual Desktop Host Pool Friendly Name" 
}
variable "validate_environment" {
  type        = string
  description = "Azure Virtual Desktop Host Pool Validate Environment"
}
variable "load_balancer_type" {
  type        = string
  description = "Azure vNet Name"
}
variable "maximum_sessions_allowed" {
  type        = string
  description = "Azure Virtual Desktop Host Pool Maximum Sessions Allowed"
}

