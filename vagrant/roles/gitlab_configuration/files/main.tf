# https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/application_settings
resource "gitlab_application_settings" "signup" {
  signup_enabled = false
}

resource "gitlab_application_settings" "localrequests" {
  allow_local_requests_from_system_hooks = true
  allow_local_requests_from_web_hooks_and_services = true
  outbound_local_requests_whitelist = [
    "localhost",
    "127.0.0.1",
    "gitlab.lokal"
  ]
}

#resource "gitlab_application_settings" "kroki" {
#  kroki_enabled = true
#  kroki_url = "http://localhost:8000"
#}

#resource "gitlab_application_settings" "elasticsearch" {
#  elasticsearch_search = true
#  elasticsearch_url = [
#    "http://localhost:9200"
#  ]
#}
