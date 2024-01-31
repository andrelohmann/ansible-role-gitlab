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

resource "gitlab_project_membership" "hello-npm" {
  project      = gitlab_project.hello-npm.id
  user_id      = gitlab_user.exampleuser.id
  access_level = "maintainer"
}

resource "gitlab_project_membership" "tf-users" {
  project      = gitlab_project.tf-users.id
  user_id      = gitlab_user.exampleuser.id
  access_level = "maintainer"
}

resource "gitlab_project_membership" "tf-state" {
  project      = gitlab_project.tf-state.id
  user_id      = gitlab_user.exampleuser.id
  access_level = "maintainer"
}
