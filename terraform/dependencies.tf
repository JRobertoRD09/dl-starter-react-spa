data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}

data "aws_ssm_parameter" "public_zone" {
  name = "/dbs/aft/publiczoneid"
}

data "aws_route53_zone" "public" {
  zone_id = data.aws_ssm_parameter.public_zone.value
}

