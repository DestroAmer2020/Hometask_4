## Hometask #4 AWS task:
- create AWS ec2 instance using ubuntu 22.04 image ami-053b0d53c279acc90
- create user “adminuser”
- set password for “adminuser” (in secure way! see documentation)
- grant for “adminuser” sudoer permission
- create user “poweruser”
- allow poweruser login without password (see /etc/passwd manual)
- grant for “poweruser” permission for iptables command (see /etc/sudoers
man)
- allow ONLY “poweruser” to read home directory of “adminuser”
- create softlink to file /etc/mtab in poweruser home directory (see ln manual)

## How to start
1. ./AWSinstance.sh

2. ssh -i "D:/urok/Mine_from_Univer_or_School/itstepuniver/ThirdCourse/IHT/KeyPem/mykeylabak.pem" adminuser@<your-ip>

3. Перевірка користувачів:
grep adminuser /etc/passwd
grep poweruser /etc/passwd

4. Спроба логіну під poweruser (без пароля):
sudo su - poweruser

5. Спроба перегляду домашньої директорії adminuser:
ls /home/adminuser

6. Симлінк до /etc/mtab:
ls -l /home/poweruser/mtab_link

7. Перевірка iptables для poweruser:
sudo /usr/sbin/iptables -L