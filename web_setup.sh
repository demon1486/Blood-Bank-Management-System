#!/bin/bash
# Web Server (XAMPP) Installation Script (Amazon Linux 2)
### support x32 app

# Update and install necessary packages
sudo yum update -y
sudo yum install -y java-17-amazon-corretto-devel curl wget zip tree libxcrypt-compat libnsl ca-certificates glibc* libstd*

# Download and install XAMPP
sudo wget https://deac-riga.dl.sourceforge.net/project/xampp/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run?viasf=1 -O /home/ec2-user/xampp-installer.run
#curl -o /home/ec2-user/xampp-installer.run https://deac-riga.dl.sourceforge.net/project/xampp/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run?viasf=1
sudo chmod +x /home/ec2-user/xampp-installer.run
sudo echo -e "YNY\nY" | sudo /home/ec2-user/xampp-installer.run

# Set file permissions for XAMPP
sudo chown -R ec2-user:ec2-user /opt/lampp
sudo chmod -R 755 /opt/lampp

# Download and extract your application
rm -fr  /opt/lampp/htdocs/*
ls -l  /opt/lampp/htdocs/
wget https://github.com/demon1486/Blood-Bank-Management-System/archive/refs/heads/main.zip -O bloodbank.zip
unzip bloodbank.zip
sudo mv Blood-Bank-Management-System-main/* /opt/lampp/htdocs/
rm bloodbank.zip

# Start XAMPP
sudo /opt/lampp/lampp start

echo "✅ XAMPP і Blood Bank Management System setup finished!!!!"
echo "🌐 Доступ: http://$(hostname -I | awk '{print $1}')/"
