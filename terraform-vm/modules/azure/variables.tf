#* Declare variables

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
  default = {
    "region"      = "East US"
    "env"         = "Dev"
    "contributor" = "Oswaldo Solano"
    "IAC"         = "Terraform"
    "IAC-v"       = "1.8.2"
  }
}
