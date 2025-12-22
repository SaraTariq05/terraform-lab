# S3 Bucket
resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name

  tags = {
    Name = "Static Website"
  }

  lifecycle {
    prevent_destroy = false
  }
}

# Disable Block Public Access
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# **REMOVE public bucket policy** to fix AccessDenied

# Enable static website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = "index.html"
  }
}

# Upload index.html
resource "aws_s3_object" "index_file" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  acl          = "public-read"  # added for public access
}


