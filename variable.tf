variable "aws_region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "ami_id" {
  type        = string
  default     = "ami-051a31ab2f4d498f5" // Replace with your desired Linux AMI
  description = "AMI ID"
}
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
}

variable "s3_bucket_storage" {
  type        = string
  default     = "my-s3-bucket-raviiiii" // Replace with a unique bucket name
  description = "S3 bucket name"
}
