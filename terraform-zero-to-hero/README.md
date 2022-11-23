# ultimate-terraform-course-for-devops
these terraform codes arranged in order from basics to advanced. It starts with creating and deploying  single ec2 instance  all the way up to deploying multiple cluster of web servers in Auto Scaling Group and Application Load Balancers.



# basics

```
resource "provider_type" "NAME" {

		[decalare all the configurations ....]

}
```

NAME --> user Defined Unique NAME

```
resource "aws_instance" "my_ec2" {
ami = "ami-0a313d6098716f372"
instance_type="t2.micro"
key_name="terraform"
}
```

- ami , instance_type, key_name --> configurations

# Deploy single server : EC2 Instance

- deploy ec2 into default VPC




