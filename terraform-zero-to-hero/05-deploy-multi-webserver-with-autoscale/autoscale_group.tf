resource "aws_autoscaling_group" "webservers_ASG" {

  launch_configuration = aws_launch_configuration.webservers-launch-conf.id
  availability_zones   = var.azone

  min_size         = 1
  max_size         = 4
  desired_capacity = 1
  tag {
    key                 = "Name"
    value               = "terraform-asg"
    propagate_at_launch = true
  }


}
