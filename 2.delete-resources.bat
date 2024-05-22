@echo off

REM Delete all resources created with Terraform on cloud providers [AWS, AZURE]
cd terraform-vm
terraform destroy -auto-approve

cd ..\terraform-res
terraform destroy -auto-approve
