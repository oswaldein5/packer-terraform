// Declare variables

variable "subscription_id" {
  description = "Subscription ID terraform-packer"
  type        = string
  sensitive   = true
}

variable "client_id" {
  description = "Client ID terraform-packer"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Client credentials terraform-packer"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Tenant ID terraform-packer"
  type        = string
  sensitive   = true
}

variable "gallery_resource_group" {
  description = "Gallery resource group name"
  type        = string
}

variable "location" {
  description = "Location"
  type        = string
}

// variable "gallery_name" {
//   description = "Gallery name"
//   type        = string
// }

// variable "image_version" {
//   description = "Image version deployed"
//   type        = string
// }
