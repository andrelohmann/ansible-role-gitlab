resource "gitlab_user" "exampleuser" {
  name             = "Example User"
  username         = "exampleuser"
  password         = "Ex@mple.123!"
  email            = "example@gitlab.lokal"
  is_admin         = false
  projects_limit   = 4
  can_create_group = false
  is_external      = false
  reset_password   = false
}

resource "gitlab_project_membership" "demopackage" {
  project      = gitlab_project.demopackage.id
  user_id      = gitlab_user.exampleuser.id
  access_level = "owner"
}

resource "gitlab_project_membership" "tfmodule" {
  project      = gitlab_project.tfmodule.id
  user_id      = gitlab_user.exampleuser.id
  access_level = "owner"
}

resource "gitlab_project_membership" "tfstate" {
  project      = gitlab_project.tfstate.id
  user_id      = gitlab_user.exampleuser.id
  access_level = "owner"
}
