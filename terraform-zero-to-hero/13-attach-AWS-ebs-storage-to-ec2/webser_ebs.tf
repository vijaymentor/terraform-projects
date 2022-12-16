resource "aws_ebs_volume" "web-ebs" {
  availability_zone = var.az
  size              = 10
  type              = "standard"
  tags = {
    Name = "webserver_data"
  }
}
resource "aws_volume_attachment" "web-ebs-attach" {
  device_name = "/dev/sdd"
  volume_id   = aws_ebs_volume.web-ebs.id
  instance_id = aws_instance.hello-world.id
  /*stop_instance_before_detaching = true*/
  force_detach = true
}

