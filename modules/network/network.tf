resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = var.tags
}

resource "aws_subnet" "vpc_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags              = var.tags

}

resource "aws_subnet" "vpc_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags              = var.tags

}

resource "aws_subnet" "vpc_subnet3" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags              = var.tags

}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags   = var.tags

}

resource "aws_route_table" "vpc_rt_igw" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }
  tags = var.tags

}

resource "aws_nat_gateway" "vpc_nat_gw_subnet2" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.vpc_subnet2.id
  tags              = var.tags
}

resource "aws_nat_gateway" "vpc_nat_gw_subnet3" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.vpc_subnet3.id
  tags              = var.tags
}

resource "aws_route_table_association" "vpc_rta" {
  subnet_id      = aws_subnet.vpc_subnet.id
  route_table_id = aws_route_table.vpc_rt_igw.id

}


