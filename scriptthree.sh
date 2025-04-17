#!/bin/bash
# Оновлення системи
apt-get update -y
apt-get upgrade -y

# Встановлення acl (для доступів)
apt-get install -y acl

# Створення adminuser з паролем (через chpasswd — так працює на Ubuntu!)
useradd -m adminuser
echo "adminuser:adminuser" | chpasswd

# Надання прав sudo
usermod -aG sudo adminuser

# Створення poweruser без пароля
useradd -m poweruser
passwd -d poweruser

# Дозвіл poweruser на запуск iptables через sudo
echo 'poweruser ALL=(ALL) NOPASSWD: /usr/sbin/iptables' >> /etc/sudoers

# Дозвіл лише poweruser бачити домашню директорію adminuser
chmod 750 /home/adminuser
setfacl -m u:poweruser:rx /home/adminuser

# Символічне посилання на /etc/mtab у home/poweruser
ln -s /etc/mtab /home/poweruser/mtab_link
