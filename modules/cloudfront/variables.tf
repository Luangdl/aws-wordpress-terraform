variable "web_acl_arn" {
  description = "WAF Web ACL ARN associated with CloudFront"
  type        = string
}

variable "tags" {
  description = "Tags to apply to CloudFront"
  type        = map(string)
}

variable "origin_verify_header_value" {
  description = "Secret header value sent by CloudFront to the origin"
  type        = string
  sensitive   = true
}

variable "origin_domain_name" {
  description = "DNS do subdomínio de origem do ALB"
  type        = string
}

variable "certificate_arn" {
  description = "ARN do certificado ACM utilizado pelo CloudFront"
  type        = string
}