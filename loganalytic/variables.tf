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
variable "internet_ingestion_enabled" {
  type        = number
  description = "Ingest logs from internet"
}
variable "internet_query_enabled" {
  type        = number
  description = "Query logs from internet"
}

