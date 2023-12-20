terraform {
  # backend "http" {}

  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "16.6.0"
    }
  }
}

provider "gitlab" {
  base_url =  var.gitlab_base_url
  token = var.gitlab_token
  insecure = true
}
