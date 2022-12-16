# Terraform outputs ?

- usage of terraform outputs
- syntax to declare output resource block
- Accessing child module output

> when you write terraform code under a folder ,that folder becomes a root module.

- Description argument in output block
- sensitive arguement in output block

--------------------------------------------------------------------------------------------------------

# why terraform output usage ?

- child module can expose a subset of it resource attributes to parent module.
- root module can use outputs to print certain values in cli output after running terraform apply
- when using remote state,root module output can be accessed by other confiugrations.

> Module-B calling Module-A,Module B becomes root or parent module.


output "instance_ip_addr" {
    values = "${aws_instance.server.private_ip"}
}

--------------------------------------------------------------------------------------------------------
## now how to access child module
# accessing child module output

module.<module_name>.output_name<>

example :
module.webservers.elb_dna_name


# arguments in poutpout block: Description:


output.tf

output "DNS_name_elb" {
    description = "outputs dns endpoint of the ELB"
    value = "${aws_elb.my_first_elb.dns_name}"
}


output "my_module_sg_id" {
    description = "outputs webserver security group id"
    value = "${aws_security_group.webserver_sg.id}"

}
--------------------------------------------------------------------------------------------------------

# you can also define sensitive output information

> output can be marked as sensitive material using the option argument sesitive=true.However it still recorded in the state and so will be visible to anyone who has access to the state data.

output "DNS_name_elb" {
    description = "outputs dns endpoint of the ELB"
    value ="${aws_elb.my_first_elb.dns_name}"
    sensitive = true
}


-------------------------------

# example refer folders

here is the example...there is 2 terraform stack

1. global_security_group
2. webserver

go to global_security_group folder

terraform init
terraform validate
terraform plan
terraform apply

now the global security group got created.

3. see the output.

```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

global_sg_id = <sensitive>

```

> the output says it is sensitive

4. now go to webserver stack module

