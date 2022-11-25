# create 5 webserver first time
# create 10 webservers again from existing 5 webservers
# reduce webservers from 15 servers to 5 servers again

- after you  executed terraform apply and once all servers are up and running.Run terraform output command and see all public ips are getting listed out.


# count variable

- we can use the same code again again with differen different values.This is only poissible via proper parameterize all the hard code values with count option.

😀


# arguments and attributes

required arguments are :

- ami
- instance_type


#  **Optional Argumewnts:**

- key_name
- availablity_zone
- monitoring

- note :
- even if we dont provide the above optional arguments we dont get errors and issues.Even we dont provide these optional arguments,not an issues.But say for an example if we dont provide key_name then we cant login to that new instance ?

# Attributes

- Terraform resource properties names and values after resources has been created.

## Few Examples

- instance id
- ARN (Amazon Resource Number)
- private_ip
- public_ip
- instance_state

# count string

```
tags = {
    Name = "Cloudnloud Tech Community-${count.index}"
  }
```

Basic Syntax
count is a meta-argument defined by the Terraform language. It can be used with modules and with every resource type.

The count meta-argument accepts a whole number, and creates that many instances of the resource or module. Each instance has a distinct infrastructure object associated with it, and each is separately created, updated, or destroyed when the configuration is applied.

resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}

# The count Object
> In blocks where count is set, an additional count object is available in expressions, so you can modify the configuration of each instance. This object has one attribute:

> count.index — The distinct index number (starting with 0) corresponding to this instance.





