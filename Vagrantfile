# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb, override|
    override.vm.box               = "precise-server-cloudimg-vagrant-amd64-disk1"
    override.vm.box_url           = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box"
    override.ssh.username         = "vagrant"
    override.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
    vb.config.vm.network :forwarded_port, host: 4567, guest: 80
  end


  config.vm.provider :aws do |aws, override|
    override.vm.box               = "dummy"
    override.vm.box_url           = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
    aws.access_key_id             = ENV['AMAZON_ACCESS_KEY_ID']
    aws.secret_access_key         = ENV['AMAZON_SECRET_ACCESS_KEY']
    aws.keypair_name              = ENV['KEYPAIR_NAME'] # => my-key
    override.ssh.private_key_path = ENV['AWS_KEY']      # => "~/.ssh/username.pem"
    aws.region                    = 'eu-west-1'
    aws.ami                       = "ami-6975691d"
    aws.instance_type             = "t1.micro"
    aws.security_groups           = ['ssh_web']
    config.ssh.username           = "ubuntu"
  end


  ## Provisioning
  config.vm.provision :shell,
    :inline => "curl -L https://www.opscode.com/chef/install.sh | bash"

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "networking_basic"
    chef.add_recipe "xinitd_rsync"
    chef.node_name = "rsync-aws"
  end

end
