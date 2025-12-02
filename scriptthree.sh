#!/bin/bash
set -x

export DEBIAN_FRONTEND=noninteractive

# Update system
apt-get update -y

# === Create adminuser securely ===
useradd -m -s /bin/bash adminuser
echo "adminuser:$(openssl passwd -6 AdminP@ssw0rd)" | chpasswd -e

# Give sudo access
usermod -aG sudo adminuser

# === Create poweruser without password ===
useradd -m -s /bin/bash poweruser
passwd -d poweruser

# === Sudo permission ONLY for iptables ===
echo "poweruser ALL=(ALL) NOPASSWD: /usr/sbin/iptables" > /etc/sudoers.d/poweruser-iptables
chmod 440 /etc/sudoers.d/poweruser-iptables

# === Allow only poweruser to read adminuser home ===
setfacl -m u:poweruser:rx /home/adminuser

# === Create symlink ===
ln -s /etc/mtab /home/poweruser/mtab_link
chown poweruser:poweruser /home/poweruser/mtab_link