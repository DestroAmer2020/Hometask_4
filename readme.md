# Hometask #4  
**Telesko Vladislav**  
**Group: 4CS-41**

## Description
This task creates and configures two users on an AWS EC2 Ubuntu instance adminuser (sudo) and poweruser (restricted).

## Requirements Implemented
Create user adminuser
Set a password for adminuser
Grant adminuser sudo permissions
Create user poweruser
Allow passwordless login for poweruser
Allow poweruser to access /home/adminuser
Allow poweruser to run only iptables with sudo
Create a symlink to /etc/mtab inside /home/poweruser

## How to start
1. Launch EC2 instance: ./AWSinstance.sh

2. Get public IP: aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress]" --output table

3. Connect to instance: ssh -i "D:/urok/Mine_from_Univer_or_School/itstepuniver/ThirdCourse/IHT/KeyPem/mykeylabak2.pem" ubuntu@<your-ip>

4. Check created users:
grep adminuser /etc/passwd
grep poweruser /etc/passwd

5. Check sudo privileges:
sudo -l -U adminuser
sudo -l -U poweruser

6. Passwordless login for poweruser
sudo passwd -S poweruser

7. Permissions of adminuser home adminuser:
ls -ld /home/adminuser

8. Check access from poweruser:
su - poweruser
cd /home/adminuser
ls -la

9. Symlink verification (after creating ln we got this)
ls -l /home/poweruser/mtab_link

10. Check iptables Using Sudo iptables sudo check: sudo /usr/sbin/iptables -L