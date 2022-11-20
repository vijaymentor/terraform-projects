resource "aws_vpc" "vijayvpcpoc" {
  cidr_block = "20.0.0.0/16"
  tags = {
    Name = "vijayvpc1"
  }
}

resource "aws_subnet" "public_subnet" {
    vpc_id     = aws_vpc.vijayvpcpoc.id
    cidr_block = "20.0.1.0/24"
  
}

resource "aws_subnet" "private_subnet" {
    vpc_id     = aws_vpc.vijayvpcpoc.id
    cidr_block = "20.0.2.0/24"
  
}


resource "aws_instance" "web" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  key_name = "testserver"
  associate_public_ip_address = true

  tags = {
    Name = "devserver"
  }
}
  
