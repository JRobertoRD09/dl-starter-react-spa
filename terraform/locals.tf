locals {
  account_id = data.aws_caller_identity.current.account_id
  partition  = data.aws_partition.current.partition

  dns_name = "${var.subdomain}.${data.aws_route53_zone.public.name}"
  aliases  = [local.dns_name]
  waf_name = "${module.this.name_prefix}-waf"

  deployment_roles = [
    "arn:aws:iam::801898201347:role/dl-aws-wlnp-dev-ipa-infcicd",
    "arn:aws:iam::801898201347:role/dl-aws-wlnp-dev-ipa-wlcicd"
  ]
  deployment_principal_arns = { for r in local.deployment_roles : r => [""] }
  artifact_tags = {
    dbs-confidentiality = lookup(module.this.tags, "dbs-confidentiality", "confidential")
    dbs-codeowners      = lookup(module.this.tags, "dbs-codeowners", "N/A")
    dbs-dataowners      = lookup(module.this.tags, "dbs-dataowners", "N/A")
    dbs-deletiondate    = lookup(module.this.tags, "dbs-deletiondate", "N/A")
    dbs-dataregulations = lookup(module.this.tags, "dbs-dataregulations", "N/A")
    dbs-privacyreview   = lookup(module.this.tags, "dbs-privacyreview", "N/A")
    dbs-securityreview  = lookup(module.this.tags, "dbs-securityreview", "N/A")
  }
}
