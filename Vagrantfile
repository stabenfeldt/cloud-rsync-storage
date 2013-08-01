# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  #config.vm.box = "precise-server-cloudimg-vagrant-amd64-disk1"
  #config.vm.network :forwarded_port, host: 4567, guest: 80

  config.vm.box = "dummy"
  config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

  config.vm.provider :aws do |aws, override|
    aws.access_key_id     = ENV['AMAZON_ACCESS_KEY_ID']
    aws.secret_access_key = ENV['AMAZON_SECRET_ACCESS_KEY']
    aws.keypair_name      = 'martins-home'
    aws.region            = 'eu-west-1'
    aws.ami               = "ami-6975691d"
    aws.instance_type     = "t1.micro"
    config.ssh.private_key_path = "~/.ec2/martins-home.pem"
    aws.security_groups = ['vagrant']
    config.ssh.username = "ubuntu"
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
