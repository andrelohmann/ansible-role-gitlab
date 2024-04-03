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

Open Gitlab:

* http://gitlab.lokal

Login credentials:

```
Username: root
Password: P@ssW0rd.123!
```

#### Mattermost

If you want to check the mattermost installation, you need to uncomment the mattermost block in playbook.yml.

* http://chat.lokal

#### Mailpit

Mailpit will act as a catch-all email server, that offers a UI, to view incoming emails (e.g. password reset).

* http://gitlab.lokal:8025

* Log in as root
* http://gitlab.lokal/admin
* Create new user
* Fetch password Email from Mailpit

#### Terraform

If you need to test the terraform config, uncomment the terrform section in playbook.yml.

Terraform will create one example group and three projects. Also it will create an exmaple user with the following credentials:

```
Username: exampleuser
Password: Ex@mple.123!
```

You can experiment with terraform by manipulationg the files in the vagrant/terraform folder and then running terraform from within the vargant machine.

#### Runners

If you need to test the runner installation and jobs, uncomment the runners section in playbook.yml (previous terraform steps are recommended).

* Login as root
* Admin Area -> CI/CD -> Runners -> activate both runners you see
* Login to gitlab with the newly created user
* Login as the exampleuser
* Add the example code from the folder vagrant/examples to the regarding projects in gitlab previously created by terraform (you can use the Web IDE to drag and drop the files)
* The examples include README.md files, that explain to you, what steps you need to do

#### LFS

Test the git lfs functionality.

* Add your public ssh key
* Clone the demopackage repository
* Follow the instructions of the documentation link

https://docs.gitlab.com/16.8/ee/topics/git/lfs/index.html

#### Buckets

After you have been walking through the previous tests, you should be able to see the S3 buckets getting filled up.

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

Test the backup command from within the vagrant machine and watch the backup bucket getting filled.

```
sudo gitlab-backup create
```

Test the lfs by following the documentation.

https://docs.gitlab.com/16.8/ee/topics/git/lfs/index.html

Test the secure files bucket by uploading a secret file.

* Go to project demopackage
* Settings -> CI/CD -> Secure Files -> Upload a text file

Test uploads by e.g. uploading a profile image.

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

## SSO

SSO is activated via keycloak.

* http://login.lokal

```
Username: admin
Password: change_me
```

There are two Users precreated for you to login to gitlab via SSO.

```
Email: john.doe@gitlab.lokal
Password: Test.123456!
```

```
Email: james.dean@gitlab.lokal
Password: Test.12345!
```
