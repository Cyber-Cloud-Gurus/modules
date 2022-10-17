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
variable "storaccpublic" {
  type        = string
  description = "Storage Account Blob Public Access"
}
variable "storacchttps" {
  type        = string
  description = "Storage Account HTTPS Only"
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
