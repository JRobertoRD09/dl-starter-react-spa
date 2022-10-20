resource "aws_s3_bucket_object" "index" {
  for_each     = fileset("${path.module}/../build/", "**/*.*")
  bucket       = module.cloudfront_s3_cdn.s3_bucket
  key          = "/${each.value}"
  source       = "${path.module}/../build/${each.value}"
  content_type = "text/html"
  etag         = filemd5("${path.module}/../build/${each.value}")

  tags = local.artifact_tags

  provider = aws.use1
}