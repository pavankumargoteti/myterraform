# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0c02fb55956c7d316" # Replace with your AMI
  instance_type = "t2.micro"
  
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-simple-bucket-12345" # Replace with a unique bucket name
}

# Create an IAM user
resource "aws_iam_user" "my_user" {
  name = "pavan"
}
