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

# Public Read Policy
resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.static_site.arn}/*"
      }
    ]
  })
}

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
}
