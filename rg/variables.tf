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
variable "upn" {
  type        = string
  description = "User Principal Name"
}
variable "rdn" {
  type        = string
  description = "Resource Definition Name"
}
variable "arg" {
  type        = string
  description = "Azure Resource Group ID"
}