variable "instance_name" {
  description = "Name tag for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the existing AWS key pair"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}
