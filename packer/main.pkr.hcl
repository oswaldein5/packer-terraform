// Define an image to create using Amazon EBS (Elastic Block Store)
source "amazon-ebs" "ubuntu" {
  ami_name      = "img-ubuntu-22.04-${formatdate("DD-MMM-YYYY-hh-mm-ss", timestamp())}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    "region"      = "US East"
    "env"         = "Dev"
    "contributor" = "Oswaldo Solano"
    "builder"     = "Packer"
    "builder-v"   = "1.10.3"
  }
}

// Define an image to create using Azure Image
source "azure-arm" "ubuntu" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  location = var.location
  managed_image_name = "img-ubuntu-22.04-${formatdate("DD-MMM-YYYY-hh-mm-ss", timestamp())}"
  managed_image_resource_group_name  = var.gallery_resource_group

  image_offer     = "0001-com-ubuntu-server-jammy"
  image_publisher = "Canonical"
  image_sku       = "22_04-lts"
  os_type         = "Linux"
  vm_size         = "Standard_B1s"

  // Define image settings for Azure Shared Image Gallery destination
  // shared_image_gallery_destination {
  //   resource_group       = var.gallery_resource_group
  //   gallery_name         = var.gallery_name
  //   image_name           = "img-ubuntu-22.04"
  //   image_version        = var.image_version
  //   storage_account_type = "Standard_LRS"
  // }

  // Define tags
  azure_tags = {
    "region"      = "East US"
    "env"         = "Dev"
    "contributor" = "Oswaldo Solano"
    "builder"     = "Packer"
    "builder-v"   = "1.10.3"
  }
}

// Configuration for building the image (Ubuntu Server 22.04, Nginx and Nodejs)
build {
  name    = "img-packer"
  sources = [
    "source.amazon-ebs.ubuntu",
    "source.azure-arm.ubuntu"
  ]
  // Post-processor to generate manifest file
  post-processor "manifest" {}
  
  // Copy files from local to remote
  provisioner "file" {
    source = "../files/"
    destination = "/tmp/"
  }

  // Install ansible
  provisioner "shell" {
    script = "../scripts/ansible.sh"
  }

  // Run playbook
  provisioner "ansible-local" {
    playbook_file = "../ansible/playbook.yaml"
  }

  // Final configuration and package cleanup
  provisioner "shell" {
    script = "../scripts/conf-clean.sh"
  }
}
