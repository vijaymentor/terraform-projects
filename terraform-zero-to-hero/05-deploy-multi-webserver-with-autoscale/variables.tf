variable "region" {
  default = "us-east-1"
}

variable "http_port" {
  default = 80
}

variable "ssh_port" {
  default = 22
}

variable "my_laptop" {
  default = "91.177.109.50/32"
}


variable "ami" {
  default = "ami-0b0dcb5067f052a63"
}


variable "instance_model" {
  default = "t2.micro"
}


variable "azone" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
