@echo off
REM Activate logs and define logfile path in Packer
REM 
set PACKER_LOG=1
set PACKER_LOG_PATH=packer.log

REM Activate logs and define logfile path in Terraform
REM `INFO | WARNING | ERROR | DEBUG | TRACE`
set TF_LOG=INFO
set TF_LOG_PATH=terraform.log

REM step.01: Create the necessary resources in Azure using Terraform prior to building the image.
cd terraform-res
terraform init
terraform plan
terraform apply -auto-approve

REM step.02: Images (Ubuntu-Nginx-Nodejs-App) are created on cloud providers [AWS, AZURE] using Packer
cd ..\packer
packer init .
packer build .

REM step.03: Create Virtual Machines on cloud providers [AWS, AZURE] using the image created with Packer via Terraform
cd ..\terraform-vm
terraform init
terraform plan
terraform apply -auto-approve