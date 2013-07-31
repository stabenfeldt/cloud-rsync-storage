cloud-rsync-storage
===================
== Create a cloud machine that can be used to store Rsync backups 

== Requirements
* Install Vagrant and Virtualbox
* Download the box we´re going to use:
  vagrant box add precise-server-cloudimg-vagrant-amd64-disk1  http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box

  vagrant up
  vagrant ssh

  sudo chpasswd rsync


