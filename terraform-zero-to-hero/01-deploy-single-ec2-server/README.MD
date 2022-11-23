# create single EC2 Server using terraform

# decide what is the ami image id you are going to launch ?
# decide what is the ec2 instance name you want ?


- "+" it is going to create
- "~" it is going to update
- "-" it is going to destroy


# step1

resource "aws_instance" "vijayec2" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  key_name      = "terraform"
}

# step 2 

- terraform init
- terraform validate
- terraform plan
- terraform apply

# now ec2 instance has been created.see the below output

```
aws_instance.vijayec2: Creating...
aws_instance.vijayec2: Still creating... [10s elapsed]
aws_instance.vijayec2: Still creating... [20s elapsed]
aws_instance.vijayec2: Still creating... [30s elapsed]
aws_instance.vijayec2: Creation complete after 33s [id=i-05eefa13860203e97]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

```


# how to modify the parameters which provisioned earlier.

resource "aws_instance" "vijayec2" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  key_name      = "terraform"

  tags = {
	 Name = "Cloudnloud Tech Community"
 }
}

```

aws_instance.vijayec2: Modifying... [id=i-05eefa13860203e97]
aws_instance.vijayec2: Modifications complete after 2s [id=i-05eefa13860203e97]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
```

