# create multiple webservers using autoscaling under Loadbalancer

> create AutoScaling Group - ASG

> whenever any new ec2 servers are launched until it attached to the existing load balancer then traffic wont be routed from internet to server.

- create launch_config.tf
- create autoscale_group.tf
- ensure all the values are decalared in varaiables.tf
- ensure security_group.tf is fine

# Now create Scaling policy - Target tracking policy...What rule this autoscaling should work. ?

create new file called auto_scaling_policy.tf

# now check AWS console all instance got created and autoscaling group and rules has been created with minimum 1 ec2 instance.

- now create file called elastic-load-balancer.tf
-- aws_elb resource

# commands

- terraform init
- terraform validate
- terraform plan
- terraform apply




load_balancers       = [aws_elb.web_lb.name]  --> [] --> list


 - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb

 - explain Attributes Reference in the above link