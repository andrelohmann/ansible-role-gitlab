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

### Access the dependency services

#### mailpit

Mailpit will act as a catch-all email server, that offers a UI, to view incoming emails.

* http://gitlab.lokal:8025

#### redis commander

redis commander offers a UI, to manage your redis content.

* http://gitlab.lokal:8081

#### minio

Minio offers a S3 compatible API and a Web UI for the management.

* http://gitlab.lokal:9001

```
Username: minioroot
Password: miniorootpw
```

Test from within the vagrant machine to copy to the bucket

```
mc alias set vagrant_access http://localhost:9000 43D9EPVMO0QGJ38GXTDO NUf8Ucvs0A84m8Ml8P4ypvMdGYigStjtJdmHeSqL
mc cp --recursive .ansible/ vagrant_access/gitlab-backup/
```

Test the backup command from within the vagrant machine

```
sudo gitlab-backup create
```

#### pgadmin

pgAdmin4 allows to access the the postgres database.

* http://gitlab.lokal:8888

```
Email: admin@gitlab.lokal
Password: admin
```

Create new server -> set the name (e.g. gitlab)

Tab Connection

* Host: localhost
* Port: 5432
* Maintenance Database: postgres
* Username: gitlab
* Password: gitlab_secret
