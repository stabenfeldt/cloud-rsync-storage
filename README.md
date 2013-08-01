cloud-rsync-storage
===================
*Create a cloud machine that can be used to store Rsync backups*


**Requirements**
* Install Vagrant and Virtualbox


```bash
$ vagrant plugin install vagrant-aws
$ vagrant up --provider=aws
```

**Create a password for the rsync user**
```bash
  $ vagrant ssh
  # From the Vagran box run:
  $ sudo chpasswd rsync
  $ echo rsync:new_password | sudo chpasswd   # [1]
  # Collect the external IP for the instance **
  $ ec2metadata | grep public-hostname
```

*[1] Not really a good approach, as the password is stored in the bash_history. Let's do it like this untill we have figured out of the terminal issues.*


**Copy your ssh keys to the rsync user, so you don't need to type a password every time**
```bash
# On the machine you're going to run the backup from
$ cat ~/.ssh/id_rsa.pub | pbcopy
$ vagrant ssh
$ sudo su - rsync
$ cat > .ssh/authorized_keys    # Paste the content of your id_rsa.pub file here..
```


**If you want to ssh into your Vagrant running in a Virtualbox at your computer**
```bash
ssh 127.0.0.1 -p 2222 -l vagrant -i ~/.vagrant.d/insecure_private_key
```

**Test rsync to Virtualbox  (with the dry-run)**
```bash
$ rsync --dry-run --delete -azvv -e ssh ~/FolderToBackup  rsync@127.0.0.1:BACKUP/ --rsh='ssh -p2222'
````

**Do an actual backup to the cloud server (without the dry-run)**
```bash
rsync --delete -azvv -e ssh ~/FolderToBackup  rsync@XXXX.compute.amazonaws.com:BACKUP/
```
