# create multiple webservers using autoscaling

create AutoScaling Group - ASG

# Difference between ec2_instance resource and launch configuration resource

- **Launch config change does not create new instance.It will be applied when new instance is spin up by auto scaling group**

- create launch_config.tf
- create autoscale_group.tf
- ensure all the values are decalared in varaiables.tf
- ensure security_group.tf is fine

# commands

- terraform init
- terraform validate
- terraform plan
- terraform apply

# now check AWS console all instance got created and autoscaling group and rules has been created with minimum 1 ec2 instance.

# Now create Scaling policy - Target tracking policy...What rule this autoscaling should work. ?

create new file called auto_scaling_policy.tf