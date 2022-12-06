# Variables

"${var.ami}"
"{var.regios}"
"${self.private_ip}"
"${var.MAP[KEY]}"  --> example :   "${var.ami[us-east-1]}"
"${var.LIST}"  -->  "${var.subnets}"

# attributes of resources

syntax :

TYPE.NAME.ATTRIBUTE

Example :

"${aws_instance.myec2.id}"

> https://developer.hashicorp.com/terraform/plugin/framework/types


# output from module

Syntax :
 - MODULE.NAME.OUTPUT

 Example :

 "${module.webservers.DNS_name_elb}"
 "${module.webservers.my_module_sg_id}"

 # Count Information

 Syntax :

 count.FIELD

 Example :

 "${count.index}"


 # path variable 

 Syntax :

 path.TYPE  || TYPE may be cwd , module or root

 Example :

 "${path.module}"

 # Terraform Meta Information :

 Syntax :

 - terraform.FIELD

 example :

 "${terraform.workspace}"

 # conditional Ternary Operator :


Syntax :

CONDITION ? TRUEVAL: FALSEVAL

Example :

reource "aws_instance" "web" {

    subnet = "${var.env_type == "production"  ?  var.prod_subnet  : var.dev_subnet}"

    }


> in theis above example there are 3 varaiables 

> 1. env_type
> 2. prod_subnet
> 3. dev_subnet

# Built - in - Function :

- file

Syntax :

file(path)   --> example :  file("user_data.sh")
)
Concat(list1,list2,list3....)  --> Example : concat("${var.server_sg}","${var.db_sg}"))
Format(format,args)  --> ex: format("%.1s",${var.instance_type})
Join (delim,list) --> example :   join(",",${var.ami_list})


_____________________________________________________________________________________________________________________________

# Data sources used in Terraform?

> For example, let's suppose we want to create a Terraform configuration for a new AWS EC2 instance. We want to use an AMI image which were created and uploaded by a Jenkins job using the AWS CLI, and not managed by Terraform. As part of the configuration for our Jenkins job, this AMI image will always have a name with the prefix app-.

> In this case, we can use the aws_ami data source to obtain information about the most recent AMI image that has the name prefix app-.

```
data "aws_ami" "app_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["app-*"]
  }
}
```

> Data sources export attributes, just like resources do. We can interpolate these attributes using the syntax data.TYPE.NAME.ATTR. In our example, we can interpolate the value of the AMI ID as data.aws_ami.app_ami.id, and pass it as the ami argument for our aws_instance resource.

```
resource "aws_instance" "app" {
  ami           = "${data.aws_ami.app_ami.id}"
  instance_type = "t2.micro"
}
```

> Data sources are most powerful when retrieving information about dynamic entities - those whose properties change value often. For example, the next time Terraform fetches data for our aws_ami data source, the value of the exported attributes may be different (we might have built and pushed a new AMI).

> Variables are used for static values, those that rarely changes, such as your access and secret keys, or a standard list of sudoers for your servers.



# The main difference between Terraform data source, resource and variable is :

Resource: Provisioning of resources/infra on our platform. Create, Update and delete!

Variable Provides predefined values as variables on our IAC. Used by resource for provisioning.

Data Source: Fetch values from our infra/provider and and provides data for our resource to provision infra/resource.

---------------------------------------------------------------------------------------------------------------------------

