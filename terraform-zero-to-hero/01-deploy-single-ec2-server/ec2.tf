resource "aws_instance" "vijayec2" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  key_name      = "terraform"
  tags = {
    Name = "Cloudnloud Tech Community"
  }
}

