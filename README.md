# gitlab

![Last test](https://github.com/andrelohmann/ansible-role-gitlab/actions/workflows/test.yml/badge.svg)

## Content

Use this role to install the latest gitlab-ce/gitlab-ee omnibus package on your ubuntu server. Get some inspiration within the vagrant ansible roles on how you can use terraform for later automation of the gitlab configuration.

### Requirements

This role requires ubuntu

### Role Variables

The default set of variables defines the gitlab installation and needs at best to be overwritten in group_vars/host_vars. You should be comfortable with the gitlab.rb config file and set the required configurations properly in the gitlab_config variable. Have a clear look at the list items. They reflect the different styles of config parameters appearing in gitlab.rb (four different styles in total). Also don't get confused by single quotes in double quotes. Some values need to be written to the gitlab.rb file as the pure value (e.g. true), while others need to be written encapsulated in string markers (single quotes).

    gitlab_release: latest  # e.g. 16.7.0-ce.0
    gitlab_ee: true  # install gitlab-ee or gitlab-ce

    # If you are relying on an external postgres database
    # pg_dump and psql need to be installed with the reflecting version number
    # gitlab_postgresql_psql_path: /usr/bin/psql
    # gitlab_postgresql_pg_dump_path: /usr/bin/pg_dump

    # Run reconfigure as installation step
    gitlab_run_reconfigure: true

    # Set an initial root password at the first ansible run
    # Password must be 8+ chars
    # gitlab_initial_root_password: __INITIAL_ROOT_PASSWORD__

    # Set the configs for gitlab.rb
    gitlab_config: []
    # gitlab_config:
    # Set the URL
    # - namespace: external_url
    #   value: "'http://gitlab.lokal'"
    # Enable the docker registry
    # - namespace: registry_external_url
    #   value: "'http://docker.lokal'"
    # - namespace: registry
    #   key: enable
    #   value: "true"
    # Set the mailpit catch all data
    # - namespace: gitlab_rails
    #   key: gitlab_email_from
    #   value: "'gitlab@example.com'"
    # - namespace: gitlab_rails
    #   key: gitlab_email_reply_to
    #   value: "'gitlab@example.com'"
    # - namespace: gitlab_rails
    #   key: smtp_enable
    #   value: "true"
    # - namespace: gitlab_rails
    #   key: smtp_address
    #   value: "'localhost'"
    # - namespace: gitlab_rails
    #   key: smtp_port
    #   value: 8025
    # Set external redis
    # - namespace: redis
    #   key: enable
    #   value: "false"
    # - namespace: gitlab_rails
    #   key: redis_host
    #   value: "'localhost'"
    # - namespace: gitlab_rails
    #   key: redis_port
    #   value: "6379"
    # - namespace: gitlab_rails
    #   key: redis_password
    #   value: "'r3dis.S3cr3t'"
    # Set external postgres
    # - namespace: postgresql
    #   key: enable
    #   value: "false"
    # - namespace: gitlab_rails
    #   key: db_adapter
    #   value: "'postgresql'"
    # - namespace: gitlab_rails
    #   key: db_encoding
    #   value: "'utf8'"
    # - namespace: gitlab_rails
    #   key: db_host
    #   value: "'localhost'"
    # - namespace: gitlab_rails
    #   key: db_port
    #   value: "5432"
    # - namespace: gitlab_rails
    #   key: db_database
    #   value: "'gitlab'"
    # - namespace: gitlab_rails
    #   key: db_username
    #   value: "'gitlab'"
    # - namespace: gitlab_rails
    #   key: db_password
    #   value: "'gitlab'"
    # Enable backups to S3
    # - namespace: gitlab_rails
    #   key: backup_upload_connection
    #   block: |
    #     gitlab_rails['backup_upload_connection'] = {
    #       'provider' => 'AWS',
    #       'region' => 'eu-central-1',
    #       'aws_access_key_id' => 'XXXXXXXXX',
    #       'aws_secret_access_key' => 'XXXXXXXXX',
    #       # # If IAM profile use is enabled, remove aws_access_key_id and aws_secret_access_key
    #       'use_iam_profile' => false
    #     }
    # - namespace: gitlab_rails
    #   key: backup_upload_remote_directory
    #   value: "'__backup_upload_remote_directory__'"
    # Set the repositories data dir
    # https://docs.gitlab.com/ee/administration/reference_architectures/2k_users.html#configure-gitaly
    # - namespace: gitaly
    #   key: configuration
    #   block: >-
    #     gitaly['configuration'] = {
    #       storage: [
    #         {
    #           name: 'default',
    #           path: '/your/repositories/mount/path',
    #         }
    #       ]
    #     }

    # Install and configure mattermost
    # gitlab_mattermost_external_url: http://chat.lokal
    # gitlab_mattermost_additional_configs:
    #   TeamSettings:
    #     SiteName: "chat.example.com"
    #   EmailSettings:
    #     EnableSignUpWithEmail: False
    #     EnableSignInWithEmail: False
    #     EnableSignInWithUsername: False
    #     SendEmailNotifications: True
    #     UseChannelInEmailNotifications: True
    #     FeedbackName: "chat.example.com"
    #     FeedbackEmail: "gitlab@example.com"
    #     SMTPUsername: "gitlab@example.com"
    #     SMTPServer: "localhost"
    #     SMTPPort: "25"
    # gitlab_mattermost_backup_dir: /var/archives/mattermost

The following mandatory item needs to be set in gitlab_config.

    gitlab_config:
    # Set the URL
    - namespace: external_url
      value: "'http://gitlab.example.com'"

### Example Playbook

    - hosts: gitlab
      become: yes
      roles:
      - { role: andrelohmann.gitlab }

## Role Development

### Special purpose

This repository supports the following features for the role development:

* yamllint
* ansible-lint
* molecule test
* github action
* auto version-up
* update ansible-galaxy
* show build status
* test within vagrant (for development purpose)
* test with molecule (inside or outside vagrant)
* test against docker container
* test and develop inside vscode

### Prerequisites

https://thedatabaseme.de/2022/01/17/automated-testing-your-ansible-role-with-molecule-and-github-actions/

* Virtualbox + Vagrant installed (only necessary, if the role should be tested with vagrant as well)
* Docker Desktop
* VisualStudioCode + remote extensionpack (dependencies are defined within .vscode/extensions.json)

### Development-Setup

This ansible role is developed using molecule for testing. It's development is based on visual studio code and a regarding development container, solving all dependencies in terms of necessary tools (ansible, linter, molecule).

The role will be tested on two ubuntu containers (noble, jammy).

To startup the molecule test containers from within the development container, the docker socket needs to be bind mounted into the development container.

#### Important folders and files

##### .devcontainer

* Defines the Dockerfile for the development container
* Configures the development container startup (e.g. bind mount docker socket)

##### molecule/default/Dockerfile.js

* Used as a template for all platforms defined in molecule/default/molecule.yml
* Prepares the environments to support systemd services (necessary for some ansible roles acting on systemd)
* Installs all requirements to run ansible against the derived container
* The file is aligned with the attributes of the platforms in molecule/default/molecule.yml
* For more information - study the molecule documentation

### Usage

#### Visual Studio Code

* Change to the root directory of your role and start vscode

```
code .
```

 * From within the development container you can use the following run commands

```
yamllint .
ansible-lint .
molecule create
molecule test
```

#### Vagrant + Virtualbox

* Change to the root directory of your role
* Change to the vagrant folder
* Start and enter the vagrant machine

```
vagrant up
vagrant ssh
```

* Change to the role folder

```
cd /etc/ansible/roles/ansible-role- [tab]
```

* Now you can run all tests

```
yamllint .
ansible-lint .
molecule create
molecule test
```

### Build and Release process

The ansible role defines a bunch of github workflows to run molecule test and release management.

The release management requires a handful of settings.

#### Protecting the master/main branch

* Settings -> Branches -> Add branch protection rule
* Branch pattern name -> main or master (depending on your default branch)
* Protect matching branches -> check "Require a pull request before merging"
* "Require approvals" can be individually handled as required

#### Give read and write permissions to GITHUB_TOKEN

* Settings -> Actions -> General -> Workflow permissions -> read and write permissions

#### Commit messages

Commit messages should follow a special format to achieve a patch, minor or major semantic versioning update.

##### patch

0.0.x

```
fix(single_word): description
```

##### minor

0.x.0

```
feat(single_word): description
```

##### major

x.0.0

```
perf(single_word): description
BREAKING CHANGE: describing the breaking change
```

It's absolutely important, that "BREAKING CHANGE: " is mentioned in the second+ line. On single line commit messages, the major version update will be ignored.

#### Add GALAXY_API_KEY secret

* Authenticate yourself with your github account at https://galaxy.ansible.com/.
* Fetch galaxy api key from Preferences -> API Key
* Open your github role repository
* Settings -> Secrets and variables -> Actions -> New repository secret
* Use "GALAXY_API_KEY" as key and the copied galaxy API key as value

## License

MIT

## Author Information

&copy; Andre Lohmann (and others) 2024

https://github.com/andrelohmann

### Maintainer Contact

* Andre Lohmann
  <lohmann.andre (at) gmail (dot) com>
