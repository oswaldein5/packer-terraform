#* Retrieve information about the created public IP
data "azurerm_public_ip" "mtc-ip-data" {
  name                = azurerm_public_ip.mtc-ip.name
  resource_group_name = azurerm_resource_group.mtc-rg.name
}

#* Retrieve information about the shared image created with Packer (if image galleries are used)
# data "azurerm_shared_image" "source_image" {
#   name                = var.image_name
#   gallery_name        = var.gallery_name
#   resource_group_name = var.gallery_group_name
# }

#* Retrieve information about the image created with Packer
data "azurerm_image" "source_image" {
  name_regex          = "^${var.image_name}*"
  resource_group_name = var.gallery_group_name
}
