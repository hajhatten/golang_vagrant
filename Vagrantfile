# -*- mode: ruby -*-
# vi: set ft=ruby

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "public_network"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/home/vagrant/go/src/github.com/hajhatten/exampleproject"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
    vb.cpus = 8
  end
  config.vm.provision "shell", path: "bootstrap.sh"
end
