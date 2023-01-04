resource "aws_vpc" "acthealth_dev_vpc" {
  cidr_block = var.vijay-vpc
}

resource "aws_subnet" "acthealth_dev_pub_subnet" {
  vpc_id     = aws_vpc.acthealth_dev_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "acthealth_dev_pub_subnet" {
  vpc_id = aws_vpc.acthealth_dev_vpc.id
}

