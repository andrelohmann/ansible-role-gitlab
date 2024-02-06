# Create a project in the example group
resource "gitlab_project" "demopackage" {
  name         = "demopackage"
  description  = "An example pypi module project"
  namespace_id = gitlab_group.example.id
}

# Create a project in the example group
resource "gitlab_project" "tfmodule" {
  name         = "tfmodule"
  description  = "An example terraform module project"
  namespace_id = gitlab_group.example.id
}

# Create a project in the example group
resource "gitlab_project" "tfstate" {
  name         = "tfstate"
  description  = "An example terraform state project"
  namespace_id = gitlab_group.example.id
}
