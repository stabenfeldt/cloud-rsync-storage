# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise-server-cloudimg-vagrant-amd64-disk1"
  config.vm.network :forwarded_port, host: 4567, guest: 80
  config.vm.provision :shell,
    :inline => "test -f $file || echo $file curl -L https://www.opscode.com/chef/install.sh | bash"

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "apt"
  end


  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "networking_basic"
    chef.add_recipe "xinitd_rsync"
    chef.node_name = "rsync-aws"
  end

end
