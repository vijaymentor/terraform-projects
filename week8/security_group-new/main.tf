provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "webserver-http" {
  name        = "webserver-http13252132e32"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0483b42696c22cf38"
}


resource "aws_security_group" "webserver-http2" {
  name        = "webserver-http12321 "
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0483b42696c22cf38"
}

resource "aws_instance" "webserver" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Webserver"
  }


}
