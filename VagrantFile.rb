# -- mode: ruby --
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.define "servidorDNS" do |servidorDNS|
        servidorDNS.vm.box = "ubuntu/trusty64"
        servidorDNS.vm.network "private_network", ip: "10.0.0.13"
        servidorDNS.vm.network "forwarded_port", guest: 80, host: 8080
        servidorDNS.vm.network "public_network", ip: "192.168.0.1" 
        servidorDNS.vm.provider "virtualbox" do |vb|
            vb.memory = "512"
            vb.cpus = 1
        end
        servidorDNS.vm.provision "shell", inline: "sudo apt update && sudo apt install nginx -y"
    end
    config.vm.define "servidorNode" do |servidorNode|
        servidorNode.vm.box = "ubuntu/trusty64"
        servidorNode.vm.network "private_network", ip: "10.0.0.15"
        servidorNode.vm.provider "virtualbox" do |vb|
            vb.memory = "1024"
            vb.cpus = 1
        end
        serverhttp.vm.provision "shell", inline: "sudo apt update && sudo apt install nodejs -y"

    end
   
end