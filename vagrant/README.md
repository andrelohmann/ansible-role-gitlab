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

### Test cases

#### Gitlab

You can test the gitlab uner the following url:

* http://gitlab.lokal

Use the following credentials for the first gitlab login:

```
Username: root
Password: P@ssW0rd.123!
```

#### Mattermost

If you want to check the mattermost installation, you need to uncomment the mattermost block in the playbook yaml.

* http://chat.lokal

#### Mailpit

Mailpit will act as a catch-all email server, that offers a UI, to view incoming emails (e.g. password reset).

* http://gitlab.lokal:8025

#### External redis

If you want to test the gitlab deployment against an external instance of redis instead of relying on the omnibus package,
you need to set the variable

    gitlab_use_external_redis: true

in the playbook.yml

To activate redis commander for a graphical way to access the redis data,
you need to set the variable

    activate_redis_commander: true

in the playbook.yml

* http://gitlab.lokal:8081

#### External postgresql

If you want to test the gitlab deployment against an external instance of postgresql instead of relying on the omnibus package,
you need to set or uncomment the following variables

    gitlab_use_external_postgresql: true
    gitlab_postgresql_psql_path: /usr/bin/psql
    gitlab_postgresql_pg_dump_path: /usr/bin/pg_dump

in the playbook.yml as well as the andrelohmann.postgresql role

To activate pgAdmin4 for a graphical way to access the postgresql data,
you need to set the variable

    activate_pgadmin: true

in the playbook.yml

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

#### Minio

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


## Test cases

The vagrant machine allows a bunch of testcases.

### Buckets and repository folders

Configure gitlab to store repositories and other persistent data at specified locations.

#### Prerequisites

* uncomment minio in vagrant/roles/docker_compose_dependecies/templates/docker-compose.yml
* uncomment all Minio tasks in vagrant/roles/docker_compose_dependecies/tasks/main.yml
* uncomment all Bucket sections and the Gitaly section of the gitlab_config variable in vagrant/playbook.yml

#### Tests
