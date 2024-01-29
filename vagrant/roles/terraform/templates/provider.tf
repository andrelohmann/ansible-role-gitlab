terraform {
  # backend "http" {}

  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "{{ gitlab_terraform_provider_release }}"
    }
  }
}

provider "gitlab" {
  base_url =  var.gitlab_base_url
  token = var.gitlab_token
  insecure = true
}
