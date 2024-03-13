module "cloudfront_s3_cdn" {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.84.0"

  enabled   = true
  namespace = var.namespace
  stage     = var.environment
  name      = module.this.name_prefix

  aliases             = local.aliases
  dns_alias_enabled   = true
  parent_zone_id      = data.aws_route53_zone.public.zone_id
  acm_certificate_arn = aws_acm_certificate.base.arn

  cors_allowed_headers = ["*"]
  cors_allowed_methods = ["GET", "HEAD"]
  cors_allowed_origins = ["*.daughertylabs.io"]
  cors_expose_headers  = ["ETag"]
  cors_max_age_seconds = 3600
  encryption_enabled   = true
  default_root_object  = "index.html"
  index_document       = "index.html"
  error_document       = ""

  price_class = "PriceClass_100"
  web_acl_id  = aws_wafv2_web_acl.ingress.arn

  deployment_principal_arns          = local.deployment_principal_arns
  block_origin_public_access_enabled = true
  origin_force_destroy               = true

  s3_access_logging_enabled           = false
  cloudfront_access_logging_enabled   = true
  cloudfront_access_log_create_bucket = true
  cloudfront_access_log_prefix        = ""
  log_standard_transition_days        = 30
  log_glacier_transition_days         = 60
  log_expiration_days                 = 90

  tags = module.this.tags

  providers = {
    aws = aws.use1
  }
}
