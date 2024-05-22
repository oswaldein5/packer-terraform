#* Define a resource group for the Packer image deployment
resource "azurerm_resource_group" "rg-packer" {
  name     = var.gallery_group_name
  location = var.location
  tags     = var.tags
}

#* Define a shared image gallery for storing custom images
# resource "azurerm_shared_image_gallery" "sig-packer" {
#   name                = var.gallery_name
#   location            = azurerm_resource_group.rg-packer.location
#   resource_group_name = azurerm_resource_group.rg-packer.name
#   tags                = var.tags
# }

#* Define a shared image in the shared image gallery
# resource "azurerm_shared_image" "si-packer" {
#   name                = "test-ubuntu-22.04"
#   gallery_name        = azurerm_shared_image_gallery.sig-packer.name
#   resource_group_name = azurerm_resource_group.rg-packer.name
#   location            = azurerm_resource_group.rg-packer.location
#   os_type             = "Linux"

#   identifier {
#     publisher = "OswaldoSolano"
#     offer     = "GreatOffer"
#     sku       = "22_04-nginx-nodejs"
#   }
#   tags = var.tags
# }
