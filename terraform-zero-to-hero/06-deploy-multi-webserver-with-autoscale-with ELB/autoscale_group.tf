resource "aws_autoscaling_group" "webservers_ASG" {

  launch_configuration = aws_launch_configuration.webservers-launch-conf.id
  availability_zones   = var.azone
  load_balancers       = [aws_elb.web_lb.name]

  min_size         = 2
  max_size         = 4
  desired_capacity = 2
  tag {
    key                 = "Name"
    value               = "terraform-asg"
    propagate_at_launch = true
  }


}
