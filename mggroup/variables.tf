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
variable "landingzones" {
  type = string
}
variable "corp" {
  type = string
}
/*variable "bu" {
    type = list(string)
}
variable "lz_bu" {
  type = list(string)
}*/
variable "platform" {
    type = string
 } 
/*variable "plat_bu" {
      type = list(string)
 }*/ 
 variable "sandboxes" {
    type = string
 }