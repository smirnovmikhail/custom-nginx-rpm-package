Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.3"
  #Vagrant with Ansible Provisioner on Windows
  #https://gist.github.com/tknerr/291b765df23845e56a29
  provisioner = Vagrant::Util::Platform.windows? ? :guest_ansible : :ansible

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.provision provisioner do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
  end

end
