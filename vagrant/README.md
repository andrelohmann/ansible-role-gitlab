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
cd /etc/ansible/roles/ansible-role-postgresql
molecule test
```

### Test the permissions via adminer

The vagrant machine also installs adminer, which can be opened via the following link:

  * http://pg.lokal/adminer

Use the following credentials (extractet from the playbook.yml) to login to the database:

```
System: PostgreSQL
Server: localhost
Username: testuser
Password: 1234test
Database: test
```
