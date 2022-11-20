output "ec2instance" {
    value = aws_instance.web.public_ip  
}