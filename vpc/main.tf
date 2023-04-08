//provider "aws" {
//  assume_role {
//    role_arn     = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
//    session_name = "SESSION_NAME"
//    external_id  = "EXTERNAL_ID"
//  }
//}



resource "aws_vpc" "Yogi-VPC-DevOps" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Yogi-VPC-DevOps"
  }

}