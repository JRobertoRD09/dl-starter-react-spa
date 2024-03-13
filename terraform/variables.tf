variable "profile" {
  description = "AWS CLI profile to use"
  type        = string
}

variable "environment" {
  description = "Standard name from enumerated list for the deployment environment. (sandbox, development, test, production)"
  type        = string
  default     = "development"
}

variable "env_subtype" {
  description = "Additional designator for sub-classification of the deployment environment if needed or else blank to ignore."
  type        = string
  default     = ""
}

variable "subdomain" {
  description = "Subdomain to combine with account's Route 53 domain to use as the applications domain name."
  type        = string
}

variable "infrastructure_cicd_role" {
  description = "Role used by infrastructure CI/CD pipelines."
  type        = string
}

variable "workload_cicd_role" {
  description = "Role used by workload CI/CD pipelines."
  type        = string
}

variable "namespace" {
  description = "One level up group name plus optional additional differentiation."
  type        = string
  default     = "ipa"
}
