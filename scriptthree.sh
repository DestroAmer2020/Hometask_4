#!/bin/bash
set -x

# Update system
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y
apt-get install -y acl

# === Create adminuser securely ===

# Create user with home directory
useradd -m -s /bin/bash adminuser

# REMOVE password instead of setting plaintext one (secure way)
passwd -d adminuser

# Give sudo access
usermod -aG sudo adminuser

# Copy SSH keys from ubuntu user
mkdir -p /home/adminuser/.ssh
cp /home/ubuntu/.ssh/authorized_keys /home/adminuser/.ssh/
chmod 700 /home/adminuser/.ssh
chmod 600 /home/adminuser/.ssh/authorized_keys
chown -R adminuser:adminuser /home/adminuser/.ssh

# === Create poweruser without password ===
useradd -m -s /bin/bash poweruser
passwd -d poweruser

# === Sudo permission ONLY for iptables ===
echo "poweruser ALL=(ALL) NOPASSWD: /usr/sbin/iptables" > /etc/sudoers.d/poweruser-iptables
chmod 440 /etc/sudoers.d/poweruser-iptables

# === Allow poweruser to read adminuser home ===
chmod 750 /home/adminuser
setfacl -m u:poweruser:rx /home/adminuser

# === Create symlink ===
ln -s /etc/mtab /home/poweruser/mtab_link
chown -h poweruser:poweruser /home/poweruser/mtab_link