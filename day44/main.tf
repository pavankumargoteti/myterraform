resource "aws_vpc" "pavan" {

    cidr_block = "192.168.0.0/16"

    tags = {


       name = "vpc" 
    }
  
}

resource "aws_subnet" "pavan" {

  cidr_block = "192.168.1.0/24"
  vpc_id = aws_vpc.pavan.id


  tags = {
    name = "mysub"
  }
}

resource "aws_internet_gateway" "pavan" {

    vpc_id = aws_vpc.pavan.id
tags = {
  name = "myIGW"
}

  
}

resource "aws_route_table" "pavan" {
    vpc_id = aws_vpc.pavan.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.pavan.id
    }
  
}

resource "aws_route_table_association" "pavan" {
    subnet_id = aws_subnet.pavan.id
    route_table_id = aws_route_table.pavan.id
  
}

resource "aws_security_group" "pavan" {
 vpc_id =  aws_vpc.pavan.id
 name = "allopw traffic"

 tags = {
   name = "mySG"
 }

 ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = "0.0.0.0/0"

 }
 ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = "0.0.0.0/0"
 }

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = "0.0.0.0/0"
}
}


