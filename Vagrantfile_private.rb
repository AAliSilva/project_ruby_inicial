# -- mode: ruby --
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

config.vm.define "servidorPython" do |servidorPython|
    servidorPython.vm.box = "hdengops/ubuntu-14.04-dev""
    servidorPython.vm.network "private_network", ip: "10.0.0.16"
    servidorPython.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 2
    end
    servidorPython.vm.provision "shell", inline: "sudo apt update && sudo pip install fastapi"
end
config.vm.define "servidorMDB" do |servidorMDB|
    servidorMDB.vm.box = "elastic/ubuntu-16.04-x86_64"
    servidorMDB.vm.network "private_network", ip: "10.0.0.17"
    servidorMDB.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
    end
end
end
