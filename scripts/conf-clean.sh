#!/bin/bash -eux

# Copiar aplicación hello.js a /var/www/html
sudo cp /tmp/hello.js /var/www/html

# Configurar pm2

# Iniciar aplicación hello.js con pm2
pm2 start /var/www/html/hello.js --name 'App'

# Configurar pm2 para iniciar la App en el arranque del sistema
eval $(pm2 startup | grep 'sudo' | sed -e 's/.*\[sudo\] //')

# Guardar las configuraciones de pm2
pm2 save

# Reiniciar el servicio de Nginx
sudo systemctl restart nginx

# Desinstalar Ansible y remover repositorio
sudo apt -y remove --purge ansible
sudo apt-add-repository --remove ppa:ansible/ansible

# Eliminar paquetes no necesarios y actualizar lista de paquetes
sudo apt -y autoremove
sudo apt -y update