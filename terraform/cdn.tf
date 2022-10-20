module "cloudfront_s3_cdn" {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.82.3"

  enabled   = true
  namespace = "dev"
  stage     = "development"
  name      = "spa_app_1"

  dns_alias_enabled   = false
  aliases             = local.alternative_domains

  cors_allowed_headers = ["*"]
  cors_allowed_methods = ["GET", "HEAD"]
  cors_allowed_origins = ["*.daugherty.com"]
  cors_expose_headers  = ["ETag"]
  cors_max_age_seconds = 3600

  price_class = "PriceClass_100"

  deployment_principal_arns          = local.deployment_principal_arns
  block_origin_public_access_enabled = true
  origin_force_destroy               = true

  s3_access_logging_enabled           = false
  cloudfront_access_logging_enabled   = true
  cloudfront_access_log_create_bucket = true
  cloudfront_access_log_prefix        = "logs/cf_access"

  tags = module.baseaws.tags

  providers = {
    aws = aws.use1
  }
}