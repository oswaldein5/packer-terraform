## Desplegar Nginx y Nodejs mediante una imagen generada por Packer en ambos proveedores de nube [AWS, Azure]

Generar en paralelo imagenes mediante ***Packer*** para los proveedores de nube [AWS, Azure]utilizando ***Ansible*** y ***Bash scripting*** para la instalación y configuración de Ubuntu, Nodejs y Nginx como Servidor Web; Garantizar el inicio automático de la aplicación (hello.js) cuando arranca o se reinicia el Servidor Web.


---
#### - Playbook de Ansible
   - [playbook.yaml](ansible/playbook.yaml)

#### - Archivos del projecto
   - [Aplicación JavaScript](files/hello.js)
   - [Configuración Servidor Web Nginx](files/nginx.conf)

#### - Scripts utilizados para la instalación y configuración de paquetes
   - [ansible.sh](scripts/ansible.sh)
   - [conf-clean.sh](scripts/conf-clean.sh)

#### - Código fuente de Terraform (creación de recursos previos a Packer)
   - [resources-img](terraform-res/resources-img.tf)

#### - Código fuente de Packer
   - [main](packer/main.pkr.hcl)

#### - Código fuente de Terraform
   - [main](terraform-vm/main.tf)
   - Módulos:
     - [aws::aws-vm](terraform-vm/modules/aws/aws-vm.tf)
     - [azure::azure-vm](terraform-vm/modules/azure/azure-vm.tf)