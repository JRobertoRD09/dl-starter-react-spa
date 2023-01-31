locals {
  contentTypesForExtensions = {
    svg : "image/svg+xml"
  }
}

resource "aws_s3_bucket_object" "index" {
  for_each     = fileset("${path.module}/../build/", "**/*.*")
  bucket       = module.cloudfront_s3_cdn.s3_bucket
  key          = "/${each.value}"
  source       = "${path.module}/../build/${each.value}"
  content_type = lookup(local.contentTypesForExtensions, reverse(split(".", "${each.value}"))[0], "text/html")
  etag         = filemd5("${path.module}/../build/${each.value}")

  tags = local.artifact_tags

  provider = aws.use1
}
