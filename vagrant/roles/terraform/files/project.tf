# Create a project in the example group
resource "gitlab_project" "hello-npm" {
  name         = "hello-npm"
  description  = "An example nodejs module project"
  namespace_id = gitlab_group.example.id
}

# Create a project in the example group
resource "gitlab_project" "tf-users" {
  name         = "tf-users"
  description  = "An example terraform module project"
  namespace_id = gitlab_group.example.id
}

# Create a project in the example group
resource "gitlab_project" "tf-state" {
  name         = "tf-state"
  description  = "An example terraform state project"
  namespace_id = gitlab_group.example.id
}
