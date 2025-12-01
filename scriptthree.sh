#!/bin/bash
set -x

export DEBIAN_FRONTEND=noninteractive

# Update system
apt-get update -y
apt-get install -y acl

# === Create adminuser securely ===
useradd -m -s /bin/bash adminuser
echo "adminuser:AdminP@ssw0rd" | chpasswd

# Give sudo access
usermod -aG sudo adminuser

# === Create poweruser without password ===
useradd -m -s /bin/bash poweruser
passwd -d poweruser

# === Sudo permission ONLY for iptables ===
echo "poweruser ALL=(ALL) NOPASSWD: /usr/sbin/iptables" > /etc/sudoers.d/poweruser-iptables
chmod 440 /etc/sudoers.d/poweruser-iptables

# === Allow poweruser to read adminuser home ===
chmod o+rx /home/adminuser

# === Create symlink ===
ln -s /etc/mtab /home/poweruser/mtab_link
chown -h poweruser:poweruser /home/poweruser/mtab_link