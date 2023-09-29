//data "terraform_remote_state" "vpc" {
 // backend = "s3"
 // config = {
 //   bucket = "yogi-tf"
 //   key = "terraform-backend/yogitf.tf"
 //   region = "ap-south-1"
 // } 
//}

data "aws_vpc" "yogi-vpc"{

filter {
 name = "tag:Name"
 values = ["Yogi-VPC-DevOps"]

}
}

data "aws_availability_zones" "yogi-az" {
  state = "available"
}

resource "aws_subnet" "private_subnet-1" {
  count = 3 //length(data.aws_availability_zones.yogi-az)
  vpc_id = data.aws_vpc.yogi-vpc.id
  cidr_block = var.private-subnet-cidr[count.index]
  
  
  tags = {
    Name = var.private-subnet-names[count.index]
  }
	 availability_zone = "${data.aws_availability_zones.yogi-az.names[count.index]}"
 
}


resource "aws_subnet" "public_subnet-1" {
 
  count = 3 //length(data.aws_availability_zones.yogi-az)
  vpc_id = data.aws_vpc.yogi-vpc.id
  cidr_block = var.public-subnet-cidr[count.index]
  
  
  tags = {
    Name = var.public-subnet-names[count.index]
  }
	 availability_zone = "${data.aws_availability_zones.yogi-az.names[count.index]}"
 
 
}

