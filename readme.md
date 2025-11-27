# Hometask #4  
**Telesko Vladislav**  
**Group: 4CS-41**

# This Hometask deploys an AWS EC2 instance (Ubuntu 22.04) and configures system users and permissions according to requirements
* Create user adminuser
* Set password for adminuser (secure method)
* Grant sudo permissions to adminuser
* Create user poweruser
* Allow passwordless login for poweruser (edit /etc/passwd)
* Allow only poweruser to read /home/adminuser
* Grant poweruser permission to use iptables (via /etc/sudoers)
* Create a softlink to /etc/mtab inside poweruser’s home directory

## How to start
1. aws ec2 run-instances --image-id ami-053b0d53c279acc90 --count 1 --instance-type t3.micro --key-name mykeylabak2 --security-group-ids sg-0b300b53d7385c546 --subnet-id subnet-06b1b42e34afc9fa8 --iam-instance-profile Name="adminEC2Role" --user-data file://scriptthree.sh
- creates EC2 instance
- configures users
- sets permissions
- creates symlink
- applies sudo rules

2. отримаємо IP адресу aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress]" --output table

3. Заходим в bash ssh -i "D:/urok/Mine_from_Univer_or_School/itstepuniver/ThirdCourse/IHT/KeyPem/mykeylabak2.pem" ubuntu@<your-ip>

4. Перевірка користувачів:
grep adminuser /etc/passwd
grep poweruser /etc/passwd

5. Спроба перегляду домашньої директорії adminuser:
ls -ld /home/adminuser
ls -ld /home/poweruser

6. Симлінк до /etc/mtab:
ls -l /etc/mtab
- su - poweruser (для заходу в poweruser)

7. Перевірка iptables для poweruser:
sudo /usr/sbin/iptables -L

8. перевірка софтлінку ls -l /home/poweruser