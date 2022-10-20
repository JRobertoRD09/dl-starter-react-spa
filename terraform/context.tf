module "this" {
  source = "git::git@bitbucket.org:DBSDEVMAN/terraform-local-dbscontext.git?ref=v0.3.0"

  enabled         = true
  organization    = "dl"
  cloud_provider  = "aws"
  namespace       = "inf"
  name            = "spa"
  environment     = "development"
  project_owners  = ["daughertylabs@daugherty.com"]
  project         = "N/A"
  project_type    = "N/A"
  code_owners     = ["daughertylabs@daugherty.com"]
  data_owners     = ["daughertylabs@daugherty.com"]
  availability    = "always_on"
  deployer        = "Terraform"
  confidentiality = "confidential"
}

module "baseaws" {
  source = "git::git@bitbucket.org:DBSDEVMAN/terraform-local-dbscontext.git?ref=v0.3.0"

  context = module.this.context
  name    = "baseaws"
}
