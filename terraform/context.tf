module "this" {
  source = "git::git@bitbucket.org:DBSDEVMAN/terraform-local-dbscontext.git?ref=v0.4.0"

  enabled         = true
  organization    = "dl"
  cloud_provider  = "aws"
  namespace       = "ipa"
  name            = "replaceme"
  environment     = var.environment
  env_subtype     = var.env_subtype
  project_owners  = ["replace.me@daugherty.com"]
  project         = "N/A"
  project_type    = "N/A"
  code_owners     = ["replace.me@daugherty.com"]
  data_owners     = ["replace.me@daugherty.com"]
  availability    = "always_on"
  deployer        = "Terraform"
  confidentiality = "confidential"
}
