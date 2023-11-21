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
variable "vnetname" {
  type        = string
  description = "Azure vNet Name"
}
variable "addcidr" {
  type        = list(string)
  description = "vNet Address Space"
}
variable "lasnetname" {
  type        = string
  description = "Log Analytic SubNet Name"
}
variable "addrsnet1" {
  type        = list(string)
  description = "Log Analytic Subnet Address"
}
variable "sendpoint" {
  type        = list(string)
  description = "Service Endpoint List"
}
variable "storaccname" {
  type        = string
  description = "Storage account Name"
}
variable "storetier" {
  type        = string
  description = "Stoorage Account Tier"
}
variable "storaccrepltype" {
  type        = string
  description = "Storage Account Replication Type"
}
variable "nrda" {
  type        = string
  description = "Network Rules Default Action"
}
variable "nriprule" {
  type        = list(string)
  description = "Network IP Rules"
}
variable "containername" {
  type        = string
  description = "Storage Account Container Name"
}
variable "containertype" {
  type        = string
  description = "Storage account container access type"
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
variable "ipname" {
  type        = string
  description = "VM Private IP Address"
}
variable "ipassigntype" {
  type        = string
  description = "VM private IP ddress assignment type"
}
variable "nsgname" {
  type        = string
  description = "VM NSG"
}
variable "vmpublicip" {
  type        = string
  description = "VM public IP Address"
}
variable "vmpubliciptype" {
  type        = string
  description = "VM public IP allocation type"
}
variable "vmimagename" {
  type        = string
  description = "VM image name"
}
variable "imageid" {
  type        = string
  description = "VM image id"
}
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
variable "vmcreate" {
  type        = string
  description = "Create VM from Image"
}
variable "admacc" {
  type        = string
  description = "VM local admin user name"
}
variable "storosdisk" {
  type        = string
  description = "VM local disk"
}
variable "admpass" {
  type        = string
  description = "VM local admin password"
}
variable "lawsname" {
  type        = string
  description = "Log Analytic Workspace Name"
}
variable "lawssku" {
  type        = string
  description = "Log Analytic Workspace SKU"
}
variable "lawsreten" {
  type        = number
  description = "Log Analytic Workspace Retention"
}