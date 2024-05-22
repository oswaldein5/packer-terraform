#* Get the ID of the image previously created with Packer
data "aws_ami" "packer_img_ami" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = ["img-ubuntu-22.04-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
