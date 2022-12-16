variable "region" {
  default = "us-east-1"
}
variable "http_port" {
  default = 80
}
variable "ssh_port" {
  default = 22
}
variable "my_system" {
  default = "0.0.0.0/0"
}

variable "ami" {
  default = "ami-0b0dcb5067f052a63"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "az" {
  default = "us-east-1a"
}


