data "aws_vpc" "yogi-vpc" {

filter {
 name = "tag:Name"
 values = ["Yogi-VPC-DevOps"]

}

}
resource "aws_internet_gateway" "internet-gateway-yogi-devops" {
  vpc_id = data.aws_vpc.yogi-vpc.id

  tags = {
    Name = "internet-gateway-yogi-devops"
  }
}