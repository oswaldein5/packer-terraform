## Deploy Nginx and Nodejs using a Packer-generated image on both cloud providers [AWS, Azure]

Parallel image generation via ***Packer*** for cloud providers [AWS, Azure] using ***Ansible*** and ***Bash scripting*** for installation and configuration of Ubuntu, Nodejs and Nginx as Web Server; Ensure automatic application startup (hello.js) when starting or restarting the Web Server.

---
#### - Ansible Playbook
   - [playbook.yaml](ansible/playbook.yaml)

#### - Project files
   - [JavaScript Application](files/hello.js)
   - [Nginx Web Server Configuration](files/nginx.conf)

#### - Scripts used for package installation and configuration
   - [ansible.sh](scripts/ansible.sh)
   - [conf-clean.sh](scripts/conf-clean.sh)

#### - Terraform source code (pre-Packer resource creation)
   - [resources-img](terraform-res/resources-img.tf)

#### - Packer source code
   - [main](packer/main.pkr.hcl)

#### - Terraform source code
   - [main](terraform-vm/main.tf)
   - Modules:
     - [aws::aws-vm](terraform-vm/modules/aws/aws-vm.tf)
     - [azure::azure-vm](terraform-vm/modules/azure/azure-vm.tf)
