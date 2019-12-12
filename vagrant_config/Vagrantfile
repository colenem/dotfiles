# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-16.04"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
   config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
   #config.vm.network "private_network", ip: "172.28.128.3"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
   #config.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)", ip: "10.10.0.34"
   #config.vm.network "public_network", use_dhcp_assigned_default_route: true, ip: "10.10.0.34"
   config.vm.network "public_network", :adapter => 2, :bridge => "en0: Ethernet", :ip => "10.10.0.34", use_dhcp_assigned_default_route: true
   #config.vm.network "forwarded_port", guest: 8880, host: 8880#, host_ip: "10.10.0.34"
   #config.vm.network "forwarded_port", guest: 8881, host: 8881#, host_ip: "10.10.0.34"
   #config.vm.network "forwarded_port", guest: 8882, host: 8882#, host_ip: "10.10.0.34"
   #config.vm.network "forwarded_port", guest: 8883, host: 8883#, host_ip: "10.10.0.34"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
   config.vm.synced_folder "~/Develop/Vagrant/www/html", "/var/www/html", :mount_options => ['dmode=777', 'fmode=777']

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
     #vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
      vb.memory = "2048"
      #vb.memory = "3072"
      #vb.memory = "4096"
      vb.name   = "ubuntu-16.04_bento_box"
      vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  #config.vm.provision "shell", path: "provision/provision.sh"
  #echo setting up static ip...
  #ifconfig eth1 10.10.0.34 netmask 255.255.255.0 up
  #route add default gw 10.10.0.1
  $script = <<-SCRIPT
  echo giving the vm some extra love...
  date > /etc/vagrant_provisioned_at
  echo starting nginx...
  sudo service nginx start
  eval `route -n | awk '{ if ($8 ==\"eth0\" && $2 != \"0.0.0.0\") print \"route del default gw \" $2; }'`
  echo "nameserver 10.10.0.19" > /etc/resolv.conf
  echo "nameserver 10.10.0.1" > /etc/resolv.conf
  echo "nameserver 8.8.8.8" > /etc/resolv.conf
  echo "nameserver 4.2.2.2" > /etc/resolv.conf
  echo all done!
  echo make sure you check for errors in the logs!
  SCRIPT
  config.vm.provision "shell", inline: $script, run: "always"
end
