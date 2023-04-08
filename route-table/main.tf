data "aws_vpc" "yogi-vpc"{

filter {
 name = "tag:Name"
 values = ["Yogi-VPC-DevOps"]
}
}

data "aws_internet_gateway" "yogi-internet-gateway-id"{

filter {
 name = "tag:Name"
 values = ["internet-gateway-yogi-devops"]

}
}

data "aws_subnet_ids" "private-subnets" {
  vpc_id = data.aws_vpc.yogi-vpc.id

  filter {
    name   = "tag:Name"
    values = ["private-subnet-*"] 
  }
}


data "aws_subnet_ids" "public-subnets" {
  vpc_id = data.aws_vpc.yogi-vpc.id

  filter {
    name   = "tag:Name"
    values = ["public-subnet-*"] 
  }
}


data "aws_subnet" "private-subnets" {
//count = "${length(data.aws_subnet_ids.private-subnets.ids)}"
count = "${length(var.private-subnet-cidr)}"
id = "${tolist(data.aws_subnet_ids.private-subnets.ids)[count.index]}"
}

data "aws_subnet" "public-subnets" {
//count = "${length(data.aws_subnet_ids.public-subnets.ids)}"
count = "${length(var.public-subnet-cidr)}"
id = "${tolist(data.aws_subnet_ids.public-subnets.ids)[count.index]}"
}


resource "aws_route_table" "public-route-table" {
  vpc_id = data.aws_vpc.yogi-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.yogi-internet-gateway-id.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = data.aws_vpc.yogi-vpc.id
   
 
  tags = {
    Name = "private-route-table"
  }
}


resource "aws_route_table_association" "private-route" {
  count = "${length(var.private-subnet-cidr)}"
  //subnet_id      = "${data.aws_subnet_ids.private-subnets.ids}"
  subnet_id =   "${element(data.aws_subnet.private-subnets.*.id, count.index)}"        //data.aws_subnet.private-subnets[count.index]
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "public-route" {
  count = "${length(var.public-subnet-cidr)}"
  //subnet_id      = "${data.aws_subnet_ids.public-subnets.ids}"
  subnet_id =   "${element(data.aws_subnet.public-subnets.*.id, count.index)}" 
  route_table_id = aws_route_table.public-route-table.id
}