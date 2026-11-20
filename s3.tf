data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "wordpress_S3" {
  bucket = "wordpress-lab-upload-${data.aws_caller_identity.current.account_id}"

  tags = merge(
    local.tags, {
      Name = "wordpress-s3"
    }
  )
}

resource "aws_s3_bucket_versioning" "versioning_enable_wordpress_S3" {
  bucket = aws_s3_bucket.wordpress_S3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "access_block_wordpress_S3" {
  bucket = aws_s3_bucket.wordpress_S3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = module.vpc.private_route_table_ids

  tags = {
    Name = "wordpress-s3-endpoint"
  }
}