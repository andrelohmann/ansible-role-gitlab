# https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/application_settings
resource "gitlab_application_settings" "signup" {
  signup_enabled                                          = false           # Disale Login
  #require_two_factor_authentication                       = true            # require two factor
  #two_factor_grace_period                                 = 24
  can_create_group                                        = false           # disallow users to create top level groups
}

#resource "gitlab_application_settings" "localrequests" {
#  allow_local_requests_from_system_hooks                  = true
#  allow_local_requests_from_web_hooks_and_services        = true
#  outbound_local_requests_whitelist                       = [
#    "localhost",
#    "127.0.0.1",
#    "gitlab.lokal"
#  ]
#}

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
