// Define required plugins for Packer
packer {
  required_plugins {
    amazon = {
        source  = "github.com/hashicorp/amazon"
        version = "~> 1.2.8"
    }
    azure = {
        source  = "github.com/hashicorp/azure"
        version = "~> 2"
    }
    ansible = {
        source = "github.com/hashicorp/ansible"
        version = "~> 1"
    }
  }
}