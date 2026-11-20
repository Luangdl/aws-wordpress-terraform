variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"
}

variable "db_password" {
  type        = string
  description = "RDS database password"
  sensitive   = true
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}