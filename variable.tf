variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type"
}

variable "ami_id" {
  type        = string
  default     = "ami-08982f1c5bf93d976" // Replace with your desired Linux AMI
  description = "AMI ID"
}
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
}

variable "s3_bucket_storage" {
  type        = string
  default     = "my-s3-bucket-giii" // Replace with a unique bucket name
  description = "S3 bucket name"
}