cloud-rsync-storage
===================
*Create a cloud machine that can be used to store Rsync backups*


**Requirements**
* Install Vagrant and Virtualbox
* Download the box we´re going to use:

```bash
$ vagrant box add precise-server-cloudimg-vagrant-amd64-disk1  \
  http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box
```

```bash
$ vagrant up
$ vagrant ssh
```

**Create a password for the rsync user**
```bash
  $ sudo chpasswd rsync
```


