# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu-trusty-64"

  config.vm.hostname = "trusty"

  config.vm.provider "virtualbox" do |vb|
    vb.customize [
      'modifyvm', :id,
      '--natdnshostresolver1', 'on',
      '--name', 'MyLinux',
      '--memory', '1024',
    ]
  end

  config.vm.provision "shell", inline: <<-SHELL
     sudo apt-get update
     sudo apt-get dist-upgrade
     sudo apt-get install build-essential
  SHELL
end
