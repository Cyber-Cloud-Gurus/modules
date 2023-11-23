variable "tags" {
  type = map(string)
  description = "Tags for Resources Management "
}
variable "fullcompanyname" {
  type = string
}
variable "shortcompanyname" {
  type = string
}
variable "CompanyManagementGroupName" {
  type = string
}
variable "region" {
  type = list(string)
}
variable "corp" {
  type = string
}
variable "hr" {
     type = string
 }
variable "landingzones" {
  type = string
}
variable "it" {
  type = string
}
variable "online" {
  type = string
}
variable "platform" {
    type = string
 } 
variable "connectivity" {
     type = string
 } 
variable "identity" {
    type = string
 }
variable "management" {
    type = string
 }
 variable "sandboxes" {
    type = string
 }