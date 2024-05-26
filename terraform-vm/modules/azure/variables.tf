#* Declare variables

variable "image_name" {}

variable "gallery_group_name" {}

# variable "gallery_name" {}

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
