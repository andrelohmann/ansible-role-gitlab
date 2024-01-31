resource "gitlab_user" "example" {
  name             = "Example User"
  username         = "example"
  password         = "Example.123"
  email            = "example@gitlab.lokal"
  is_admin         = false
  projects_limit   = 4
  can_create_group = false
  is_external      = false
  reset_password   = false
}

resource "gitlab_project_membership" "example" {
  project      = gitlab_project.example.id
  user_id      = gitlab_user.example.id
  access_level = "maintainer"
}
