gitlab
======

[![Build Status](https://travis-ci.org/andrelohmann/ansible-role-gitlab.svg?branch=master)](https://travis-ci.org/andrelohmann/ansible-role-gitlab)

Use this role to install the latest gitlab-ce/gitlab-ee omnibus package on your ubuntu server.

Requirements
------------

This role requires ubuntu.

Role Variables
--------------

The default set of variables defines the gitlab installation and needs at best to be overwritten in group_vars/host_vars

    gitlab_release: False # e.g. 12.4.3-ce.0
    gitlab_ee: False # install gitlab-ee or gitlab-ce
    # gitlab_initial_root_password: __INITIAL_ROOT_PASSWORD__
    # gitlab_external_url: http://gitlab.example.com
    gitlab_letsencrypt_enable: False
    # gitlab_additional_configs:
    # - namespace: gitlab_rails
    #   var: gitlab_email_from
    #   value: "'gitlab@example.com'"
    # - namespace: gitlab_rails
    #   var: gitlab_email_reply_to
    #   value: "'gitlab@example.com'"
    # - namespace: gitlab_rails
    #   var: smtp_enable
    #   value: "true"
    # - namespace: gitlab_rails
    #   var: smtp_address
    #   value: "'localhost'"
    # - namespace: gitlab_rails
    #   var: smtp_port
    #   value: 25
    # gitlab_registry_external_url: http://docker.example.com
    # gitlab_mattermost_external_url: http://chat.example.com
    gitlab_mattermost_additional_configs:
      # TeamSettings:
      #   SiteName: "chat.example.com"
      EmailSettings:
        EnableSignUpWithEmail: False
        EnableSignInWithEmail: False
        EnableSignInWithUsername: False
        # SendEmailNotifications: True
        # UseChannelInEmailNotifications: True
        # FeedbackName: "chat.example.com"
        # FeedbackEmail: "gitlab@example.com"
        # SMTPUsername: "gitlab@example.com"
        # SMTPServer: "localhost"
        # SMTPPort: "25"
    gitlab_mattermost_backup_dir: /var/archives/mattermost
    gitlab_activate_monitoring: False
    gitlab_disable_signup: True # only allow root and admins to create users

The following mandatory variables need to be set in group_vars/host_vars

    gitlab_external_url: http://gitlab.example.com

Example Playbook
----------------

    - hosts: gitlab
      roles:
         - andrelohmann.gitlab

License
-------

MIT

Author Information
------------------

https://github.com/andrelohmann
