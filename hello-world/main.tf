resource "aws_instance" "webserver" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "finance" {
  bucket = "finanace-cnl-1980"
  tags = {
    Description = "Finance and Payroll"
  }
}


resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Team Leader"
  }
}
