Vagrant.configure("2") do |config|
  config.vm.hostname = "container-lab-vm" # Define o hostname da máquina Vagrant
  config.vm.provider "vmware_desktop" do |vb|
    vb.vmx["vhv.enable"] = "TRUE" # Habilita virtualização para dentro da VM
    vb.memory = 32768 # Define a quantidade de memória RAM da VM
    vb.cpus = 4 # Define a quantidade de CPUs da VM
  end

  config.vm.box = "generic/ubuntu2204" # Define a box base para a VM, que é uma imagem do Ubuntu 22.04 - https://portal.cloud.hashicorp.com/vagrant/discover/generic/ubuntu2204
  config.vm.box_version = "4.3.12"
  config.vm.synced_folder ".", "/home/vagrant/shared" # Compartilha a pasta atual (onde o Vagrantfile está) para /home/vagrant na VM
  config.vm.network "public_network" # Conecta a VM na mesma rede que o computador host
  config.vm.provision "shell", path: "setup.sh" # Instalação do containerlab e dependências via script oficial
end