
provider "aws" {
  region = "us-east-1"
}

# resource block for ec2  #
resource "aws_instance" "myec2" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  tags = {
    Description = "server1-cnl"
  }
}


resource "aws_eip" "lb" {
  vpc = true
  tags = {
    Description = "server1-cnl-EIP"
  }
}
