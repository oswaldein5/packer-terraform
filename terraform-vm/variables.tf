#* Declare variables

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

variable "image_name" {
  description = "Image name"
  type        = string
}

variable "gallery_group_name" {
  description = "Gallery group name"
  type        = string
}

# variable "gallery_name" {
#   description = "Gallery name"
#   type        = string
# }

variable "tags" {
  description = "Project Tags"
  type        = map(string)
}
