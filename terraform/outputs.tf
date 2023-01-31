output "cf_arn" {
  value = module.cloudfront_s3_cdn.cf_arn
}

output "cf_domain_name" {
  value = module.cloudfront_s3_cdn.cf_domain_name
}

output "s3_bucket" {
  value = module.cloudfront_s3_cdn.s3_bucket
}

output "cf_id" {
  value = module.cloudfront_s3_cdn.cf_id
}
