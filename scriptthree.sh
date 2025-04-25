#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install -y acl

# Створення adminuser з паролем
useradd -m adminuser
echo "adminuser:adminuser" | chpasswd
usermod -aG sudo adminuser

# Копіюємо SSH ключ з ubuntu
mkdir -p /home/adminuser/.ssh
cp /home/ubuntu/.ssh/authorized_keys /home/adminuser/.ssh/
chown -R adminuser:adminuser /home/adminuser/.ssh
chmod 700 /home/adminuser/.ssh
chmod 600 /home/adminuser/.ssh/authorized_keys

# Створення poweruser без пароля
useradd -m poweruser
passwd -d poweruser

# Дозвіл на iptables
echo 'poweruser ALL=(ALL) NOPASSWD: /usr/sbin/iptables' >> /etc/sudoers

# Права доступу
chmod 750 /home/adminuser
setfacl -m u:poweruser:rx /home/adminuser

# Символічне посилання
ln -s /etc/mtab /home/poweruser/mtab_link