resource "aws_instance" "hello-world" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
  availability_zone      = var.az
  key_name               = "terraform"
  tags = {
    Name = "Hello world"
  }
  user_data = <<EOF
#!/bin/bash
sudo amazon-linux-extras install epel -y
sudo /bin/yum install httpd -y
sudo /bin/systemctl restart httpd
sudo /bin/systemctl enable httpd
sudo su
sudo /bin/echo "Hello world " >/var/www/html/index.html
instance_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
sudo echo $instance_ip >>/var/www/html/index.html
ls
EOF

}
