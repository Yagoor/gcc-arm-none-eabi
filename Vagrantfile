Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-16.04"

    config.vm.synced_folder ".", "/home/vagrant/gcc-arm-none-eabi"

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = 2
    end
    
    config.vm.provision "shell", path: "bootstrap-ubuntu-16.04.sh"    
end
