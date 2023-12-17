provider "aws" {
  region = "ap-south-1"  # Replace with your desired region

}


resource "aws_instance" "example" {
  ami           = "ami-02a2af70a66af6dfb"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  #key_name      = "your-key-pair"  # Replace with your key pair name

  tags = {
    Name = "ExampleInstance"
  }

}



 resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}   
 resource "aws_vpc" "my_vpc2" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc2"
  }
 }
 resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "my_subnet"
  }
}