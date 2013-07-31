# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  #config.vm.box = "dummy"
  config.vm.box = "precise32"
  #config.vm.box = "precise-server-cloudimg-vagrant-amd64-disk1"
  config.vm.network :forwarded_port, host: 4567, guest: 80

  config.vm.provider :aws do |aws, override|
    #aws.access_key_id     = ENV['STABENFELDT_AWS_ACCESS_KEY_ID']
    #aws.secret_access_key = ENV['STABENFELDT_SECRET_ACCESS_KEY']
    aws.access_key_id     = ENV['MAKE_AWS_ACCESS_KEY_ID']
    aws.secret_access_key = ENV['MAKE_AWS_SECRET_ACCESS_KEY']
    #aws.keypair_name      = "make-martins"
    aws.region            = "eu-west-1"
    #override.ssh.private_key_path = "~/.ssh/make-martins.pem"
    

    aws.ami = "ami-7747d01e"

    override.ssh.username         = "martins"
  end


  ## Provisioning
  config.vm.provision :shell,
    :inline => "curl -L https://www.opscode.com/chef/install.sh | bash"

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "apt"
  end


  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "networking_basic"
    chef.add_recipe "xinitd_rsync"
    chef.node_name = "rsync-aws"
  end

end
