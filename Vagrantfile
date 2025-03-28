# -*- mode: ruby -*-
# vi: set ft=ruby :

$install_deps = <<-SHELL
  sudo apt-get update -y
  sudo apt-get install -y openjdk-17-jdk openjdk-17-jre curl wget zip tree

  wget https://deac-riga.dl.sourceforge.net/project/xampp/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run -O /home/vagrant/xampp-installer.run
  chmod +x /home/vagrant/xampp-installer.run
  sudo echo -e "YNY\nY" | sudo /home/vagrant/xampp-installer.run
  sudo chown -R vagrant:vagrant /opt/lampp
  echo "/opt/lampp/lampp start" >> /home/vagrant/.bashrc
  cp -R /vagrant/* /opt/lampp/htdocs/


SHELL

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.network "private_network", ip: "192.168.100.100"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
#     vb.gui = true   # Enable GUI
  end

  config.vm.provision "shell", inline: $install_deps
end
