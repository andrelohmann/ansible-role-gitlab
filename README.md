gitlab
======

[![Build Status](https://travis-ci.org/andrelohmann/ansible-role-gitlab.svg?branch=master)](https://travis-ci.org/andrelohmann/ansible-role-gitlab)

Use this role to install the latest gitlab-ce omnibus package on your ubuntu server.

Requirements
------------

This role requires ubuntu.

Role Variables
--------------

The default set of variables defines the gitlab installation and needs at best to be overwritten in group_vars/host_vars

    gitlab_use_https: True
    gitlab_ssl_certificate: /etc/gitlab/ssl/example.com.crt
    gitlab_ssl_certificate_key: /etc/gitlab/ssl/example.com.key
    gitlab_activate_mattermost: true
    gitlab_mattermost_url: chat.example.com
    gitlab_mattermost_backup_dir: /var/archives/mattermost
    gitlab_custom_nginx_config: /etc/nginx/conf.d/example.conf
    gitlab_additional_configs: # e.g. gitlab_rails['gitlab_email_from'] = 'gitlab@example.com'
    - namespace: gitlab_rails
      var: gitlab_email_from
      value: "'gitlab@example.com'"
    - namespace: gitlab_rails
      var: gitlab_email_reply_to
      value: "'gitlab@example.com'"

The following mandatory variables need to be set in group_vars/host_vars

    gitlab_external_url: gitlab.example.com
    gitlab_registry_url: docker.example.com

Example Playbook
----------------

    - hosts: gitlab
      roles:
         - { role: andrelohmann.gitlab }

License
-------

MIT

Author Information
------------------

https://github.com/andrelohmann
