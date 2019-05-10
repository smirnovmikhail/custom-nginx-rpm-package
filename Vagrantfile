Vagrant.configure(2) do |config|
  provisioner = Vagrant::Util::Platform.windows? ? :guest_ansible : :ansible
  config.vm.box = "bento/centos-7.3"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.provision provisioner do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
  end

end
