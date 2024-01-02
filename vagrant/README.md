# Test your role with vagrant

Test your role with vagrant

## Prerequisites

* Virtualbox is installed
* Vagrant is installed
* vagrant up will install vagrant-hostmanager module

## Test process

```
cd vagrant
vagrant up
```

The vagrant role will be applied automatically during the vagrant up process.

### Test with molecule from inside vagrant

```
vagrant ssh
cd /etc/ansible/roles/ansible-role-gitlab
molecule test
```

### Test the installation

You can test the several domains:

* http://gitlab.lokal
* http://chat.lokal

Use the following credentials for the first gitlab login:

```
Username: root
Password: P@ssW0rd.123!
```
