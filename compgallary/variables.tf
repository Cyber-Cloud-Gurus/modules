variable "rgname" {
  type        = string
  description = "Resource Group Name"
}
variable "location" {
  type        = string
  description = "The location for the deploymnet"
}
variable "tags" {
  type = map(string)
}
variable "containername" {
  type        = string
  description = "Storage Account Container Name"
}
variable "storaccname" {
  type        = string
  description = "Storage account Name"
}
variable "vmimagename" {
  type        = string
  description = "VM image name"
}
