#!/bin/bash
# SQL Server (MariaDB) Installation Script (RHEL 9)

# Update and install necessary packages
sudo yum update -y
sudo yum install -y mariadb-server wget unzip

# Start and enable MariaDB
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure MariaDB installation
sudo mysql_secure_installation <<EOF
y
Admin
Admin
y
y
y
y
EOF

# Create MySQL database and user
sudo mysql -u root -pAdmin -e "CREATE DATABASE bloodbank;"
sudo mysql -u root -pAdmin -e "CREATE USER 'bloodbank_user'@'%' IDENTIFIED BY 'bloodbank_password';" # '%' allows remote connections
sudo mysql -u root -pAdmin -e "GRANT ALL PRIVILEGES ON bloodbank.* TO 'bloodbank_user'@'%';"
sudo mysql -u root -pAdmin -e "FLUSH PRIVILEGES;"

# Download and import SQL files using wget and unzip
wget https://github.com/DevOps2-Fundamentals/Blood-Bank-Management-System/archive/03c994bace6daa5fb6af800ca548ad1b97a89360.zip -O bloodbank_sql.zip
unzip bloodbank_sql.zip
cd Blood-Bank-Management-System-03c994bace6daa5fb6af800ca548ad1b97a89360/sql

for sqlfile in *.sql; do
  sudo mysql -u bloodbank_user -pbloodbank_password bloodbank < "$sqlfile"
done

cd ../..
rm -rf Blood-Bank-Management-System-03c994bace6daa5fb6af800ca548ad1b97a89360/
rm bloodbank_sql.zip

sudo systemctl restart mariadb

echo "MariaDB installation and SQL import complete."
