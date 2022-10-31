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
variable "cosmo_db_acount_name" {
  type        = string
  description = "The name of Cosmo DB account name"
}
variable "failover_location" {
  type        = string
  description = "The name of Cosmo DB failover location"
}
variable "sq_db_name" {
  type        = string
  description = "The name of Cosmo DB account name"
}