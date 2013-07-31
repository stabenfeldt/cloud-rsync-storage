cloud-rsync-storage
===================
*Create a cloud machine that can be used to store Rsync backups*


**Requirements**
* Install Vagrant and Virtualbox
* Download the box we´re going to use:

```bash

$ vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
$ vagrant box add precise-server-cloudimg-vagrant-amd64-disk1  \
  http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-amd64-disk1.box
```

```bash
$ vagrant plugin install vagrant-aws
$ vagrant up
$ vagrant ssh
```

**Create a password for the rsync user**
```bash
  $ sudo chpasswd rsync
```




➜  Vagrant git:(master) ✗ brew install ec2-ami-tools
Warning: Your Xcode (4.6) is outdated
Please install Xcode 4.6.2.
==> Downloading http://ec2-downloads.s3.amazonaws.com/ec2-ami-tools-1.4.0.9.zip
######################################################################## 100.0%
==> Caveats
Before you can use these tools you must export some variables to your $SHELL
and download your X.509 certificate and private key from Amazon Web Services.

Your certificate and private key are available at:
http://aws-portal.amazon.com/gp/aws/developer/account/index.html?action=access-key

Download two ".pem" files, one starting with `pk-`, and one starting with `cert-`.
You need to put both into a folder in your home directory, `~/.ec2`.

To export the needed variables, add them to your dotfiles.
 * On Bash, add them to `~/.bash_profile`.
 * On Zsh, add them to `~/.zprofile` instead.

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
