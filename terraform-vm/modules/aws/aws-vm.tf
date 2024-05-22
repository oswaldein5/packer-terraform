#* Create security group
resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "VPC Web"

  #* Inbound rules
  dynamic "ingress" {
    for_each = [22, 80]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  #* Outbound rules
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Security-Group"
  }
}

#* log_group
resource "aws_cloudwatch_log_group" "log_group" {
  name              = "log-group-vm"
  retention_in_days = 1
}

#* log-stream
resource "aws_cloudwatch_log_stream" "log_stream" {
  name           = "vm-log-stream"
  log_group_name = aws_cloudwatch_log_group.log_group.name
}

#* Create EC2 Instance using the AMI image previously built with Packer
resource "aws_instance" "public_instance" {
  #* ID of the image created with Packer obtained with the datasource "packer_img_ami"
  ami                    = data.aws_ami.packer_img_ami.id
  instance_type          = "t2.micro"
  key_name               = "mykey"
  vpc_security_group_ids = [aws_security_group.vpc-web.id]
  tags = {
    Name = "Instance-EC2"
  }
}
