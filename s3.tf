# S3 bucket for hosting a static website.
resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name
  tags = {
    Name = "static_website"
  }
}

# Ownership controls for the S3 bucket.
resource "aws_s3_bucket_ownership_controls" "static_website" {
  bucket = aws_s3_bucket.static_website.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Public access settings for the S3 bucket.
resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

# ACL for the S3 bucket to set public read access.
resource "aws_s3_bucket_acl" "static_website" {
  depends_on = [
    aws_s3_bucket_ownership_controls.static_website,
    aws_s3_bucket_public_access_block.static_website,
  ]

  bucket = aws_s3_bucket.static_website.id
  acl = "public-read"
}

# Bucket policy to allow public read access.
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowPublicReadAccess",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:GetObject",
        "Resource": "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

# Module for template files.
module "template_files" {
    source = "hashicorp/dir/template"

    base_dir = "${path.module}/web-files"
}

# Website configuration for the S3 bucket.
resource "aws_s3_bucket_website_configuration" "web-config" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }
}

# S3 objects for hosting website files.
resource "aws_s3_object" "Bucket_files" {
  bucket = aws_s3_bucket.static_website.id

  for_each = module.template_files.files
  key = each.key
  content_type = each.value.content_type

  source = each.value.source_path
  content = each.value.content

  etag = each.value.digests.md5
}


