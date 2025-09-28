# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

# Subnet
resource "aws_subnet" "subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-east-1a"
}

# Security Group
resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# S3 Bucket
resource "aws_s3_bucket" "example" {
  bucket = var.s3_bucket_storage
}

# EC2 Instance
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.example.id]

  user_data = <<-EOF
                #!/bin/bash
                ${file("${path.module}/scripts/git.sh")}
            EOF

  tags = {
    Name = "terraform-instance"
  }
}
