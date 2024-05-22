#!/bin/bash -eux

# Instalar repositorio de Ansible
sudo apt -y update && sudo apt-get -y upgrade
sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible

# Instalar Ansible
sudo apt -y update
sudo apt -y install ansible