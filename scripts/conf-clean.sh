#!/bin/bash -eux

# Copy hello.js application to /var/www/html
sudo cp /tmp/hello.js /var/www/html

# Configure pm2

# Starting hello.js application with pm2
pm2 start /var/www/html/hello.js --name 'App'

# Configure pm2 to start the App at system startup
eval $(pm2 startup | grep 'sudo' | sed -e 's/.*\[sudo\] //')

# Save pm2 settings
pm2 save

# Restart the Nginx web server
sudo systemctl restart nginx

# Uninstall Ansible and remove repository
sudo apt -y remove --purge ansible
sudo apt-add-repository --remove ppa:ansible/ansible

# Remove unneeded packages and update package list
sudo apt -y autoremove
sudo apt -y update