variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "sara-static-site-terraform-2025-docker-v1"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}
