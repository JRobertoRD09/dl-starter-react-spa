resource "aws_wafv2_web_acl" "ingress" {
  provider    = aws.use1
  name        = local.waf_name
  description = "Protection of ${module.this.name_prefix} CloudFront."
  scope       = "CLOUDFRONT"
  default_action {
    allow {}
  }

  rule {
    name     = "awscommon"
    priority = 1
    override_action {
      count {}
    }
    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "${local.waf_name}-common"
      sampled_requests_enabled   = false
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = local.waf_name
    sampled_requests_enabled   = false
  }

  tags = merge(module.this.tags, {
    Name = local.waf_name
  })
}
