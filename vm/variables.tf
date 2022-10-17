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
variable "storcaching" {
  type        = string
  description = "VM Storage Caching"
}
variable "storacctype" {
  type        = string
  description = "VM Storage Account Type"
}
variable "nicname" {
  type        = string
  description = "VM network interface name"
}
/*variable "vmimagename" {
  type        = string
  description = "VM image name"
}
/*variable "imageid" {
  type        = string
  description = "VM image id"
}*/
variable "vmname" {
  type        = string
  description = "VM name"
}
variable "computername" {
  type        = string
  description = "Computer Name"
}
variable "vmsize" {
  type        = string
  description = "VM size"
}
/*variable "vmcreate" {
  type        = string
  description = "Create VM from Image"
}*/
variable "storosdisk" {
  type        = string
  description = "VM local disk"
}
variable "zones" {
  description = "Availability Zones"
}
variable "zone" {
  description = "Availability Zones"
}
variable "md_name1" {
  description = "Manged Disk Name"
}
variable "storage_account_type" {
  description = "Manged Disk Storage Account Type"
}
variable "create_option" {
  description = "Manged Disk create option"
}
variable "disk_size_gb" {
  description = "Manged Disk size"
}
variable "lun" {
  description = "Manged Disk lun number"
}
variable "caching" {
  description = "Manged Disk chacing"
}

variable "admacc" {
  type        = string
  description = "VM local admin user name"
}
variable "admpass" {
  type        = string
  description = "VM local admin password"
}
variable "lawsname" {
  type        = string
  description = "Log Analytic Workspace Name"
}
