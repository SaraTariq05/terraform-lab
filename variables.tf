variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "static-site-terraform-docker-v2.1" 
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}
