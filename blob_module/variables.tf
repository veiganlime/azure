variable "resource_group_name" {
  type        = string
  default     = "lime"
  description = "description"
}
variable "resource_group_location" {
  type        = string
  default     = "West Europe"
  description = "description"
}
variable "base_resource_group_location" {
  type        = string
  default     = ""
  description = "description"
}
variable "base_name_blob" {
  type        = string
  default     = ""
  description = "description"
}
variable "blob_type" {
  type        = string
  default     = "Block"
  description = "description"
}
variable "blob_source" {
  type        = string
  default     = "toupload.txt"
  description = "description"
}
variable "storage_account_tier" {
  type        = string
  default     = "Standard"
  description = "description"
}
variable "storage_account_replication_type" {
  type        = string
  default     = "LRS"
  description = "description"
}
variable "storage_container_container_access_type" {
  type        = string
  default     = "private"
  description = "description"
}
variable "base_name_container" {
  type        = string  
  description = "description"
}
variable "base_name_account" {
  type        = string
  description = "description"
}

