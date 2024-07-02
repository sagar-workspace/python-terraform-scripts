#Access credentails IAM
provider "aws" {
  region     = "ap-south-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

#EC2 instance creation
resource "EC2_instance_terraform" "ap-south-1" {
  ami           = "ami-005e54dee72cc1d00" # ap-south-1 #name of ec2 instance ami while creating in GUI
  instance_type = "t2.micro"
}

#Creation of S3 Bucket
resource "aws_s3_bucket" "myFirstBucket" {
  bucket = "terraform-S3-Bucket"

  tags = {
    Name        = "My Terraform bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
versioning{    #to restore and the track of every objects in the S3 Bucket
enabled=true
}

#Creation of VPC
resource "aws_vpc" "ergos_vpc" {
  cidr_block       = "172.31.0.0/16" #vpc IPv4 CIDR
  instance_tenancy = "default"

  tags = {
    Name = "terrafrom-ergos-vpc"
  }
}

#Creation of Subnets
resource "aws_subnet" "ergos_pubsub_01" {
  vpc_id     = aws_vpc.ergos_vpc.id
  cidr_block = "172.31.0.0/16" #vpc IPv4 CIDR

  tags = {
    Name = "terraform-ergos-subnet"
  }
}

#Creation of RDS
resource "aws_db_instance" "terraform-rds-db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7_terraform"
  skip_final_snapshot  = true
}
