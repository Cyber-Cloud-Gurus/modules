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
variable "vnetname" {
  type        = string
  description = "Azure vNet Name"
}
variable "addcidr" {
  type        = list(string)
  description = "vNet Address Space"
}
variable "snetname" {
  type        = string
  description = "SubNet Name"
}
variable "snetaddr" {
  type        = list(string)
  description = "SubNet Address"
}
variable "sendpoint" {
  type        = list(string)
  description = "Service Endpoint List"
}
variable "nicname" {
  type        = string
  description = "VM network interface name"
}
variable "privateip" {
  type        = string
  description = "VM NIC Private IP Address"
}
variable "ipassigntype" {
  type        = string
  description = "VM private IP ddress assignment type"
}
variable "nsgname" {
  type        = string
  description = "NSG Name"
}
variable "publicip" {
  type        = string
  description = "VM public IP Address"
}
