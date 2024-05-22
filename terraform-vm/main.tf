#* Creating resources to create VMs from the image deployed with Packer

#* VM creation and deployment on AWS cloud provider
module "aws-vm" {
  source = "./modules/aws"
}

#* VM creation and deployment on AZURE cloud provider
module "azure-vm" {
  source             = "./modules/azure"
  image_name         = var.image_name
  gallery_group_name = var.gallery_group_name
  #gallery_name       = var.gallery_name
}
