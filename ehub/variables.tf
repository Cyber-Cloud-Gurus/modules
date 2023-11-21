variable "tags" {
  type = map(string)
  description = "Tags for Resources Management "
}
variable "parent" {
  type        = string
  description = "Parent Management Group"
}
variable "child" {
  type        = string
  description = "Child Management Group"
}

