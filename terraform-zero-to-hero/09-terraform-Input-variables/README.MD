# Terraform Input Variables

> Declare Input Variables
> Variable Names
> Declare input variable : documentation
> Assigning value to variable
> variable defination precedence -- in which order terraform going to take values ?


-----

# Decalare Input variables

- each input varaiable must be declared using varaible block

```
variable "region" {
    default = "us-east-1"
    }
```

# how to declare input variables ?

> each input variaable must be declared using variable block

variable "avaialblity_zone_name" {

    type = list{string}
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# another type of varaible ?

> each input variaable must be declared using variable block

variable "amis" {

    type = map
    default = {
        us-east-1="ami-0a234345d232f346" #north_virginia
        us-east-2="ami-0512243f43d43223" #ohio
        us-west-1="ami-08sdfsd324sdfewr" #california

    }
}

> how do you lookup this above from terrform 
> for example : ami = ${var.amis["us-east-1"]}


---------------

# variable name can be anything except below

>source
>locals
>version
>providers
>count
>for_each
>lifecycle
>depends_on

These cannot used as terraform input varaiables .[these above words are reserved by terraform.so you cant use the above names as an veriable name.]

----------------------

# varaiables Type :

> **type = any** accepts any input variables,however its always better to restrict variable value type to below :

- string
- number
- bool
- list
- set --> similar to both tuple and lists.
- map
- object --> similer to map
- tuple --> similar to list

> so while you defining varaiables,if you specify the type of varaiable inpout then the user bound to that type only while giving the input for that variable. :-)

-------

# whenever you declare any varaiable make sure you are providing good clear description for future support.

> each input variable must be declared using varaiable block

variable "region" {
    description = "name of region is used to create resources in specified region"
    region = "us-east-1"
}


------

# Assigning values to variables :

> Assign as default value
> individually with -var command line option

```
terraform apply -var="us-east-1"
```

> variable values defined in .tfvars file

- create file myproject.tfvars and put all varaiable values.pass that file name in command line as below :

```
terraform apply -var-file="myproject.tfvars"
```

> if you are using multiplke  .tfvars file please make sure you are tagging properly with descriptions and comanets wherever poissible that which tfvar file used for which environment.


- Export as terraform variable named TF_VAR_

```
# export TF_VAR_REGION=us-east-1
# terraform plan
terraform apply
```


# what order terraform will take the varaiables definations precedence



## variable precedence [ which variable will take first priority]

```
main.tf

resource local_file pet { 
  filename = var.filename
}
```
```
variables.tf
variable filename { 
  type	= string
}
```

- ** for the above we can pass value in 4 ways**

- ** variable approach 1 called environment variables**
```
export TF_VAR_filename="/root/cats.txt" 
```
- ** variable approach 2 called terraform.tfvars**
```
terraform.tfvars
filename = "/root/pets.txt"
```

- ** variable approach 3 called auto loading auto.tfvars **
```
variable.auto.tfvars
filename = "/root/mypet.txt"
```


- **variable approach 4 - called command line arguments**
```
terraform apply -var "filename=/root/best-pet.txt" ?

```
- **in the above 4 approach what order the terraform can give priority.**


Order | Option | Description | Priority
:------|:------|:------|:------
1 | Environment Variables | first terraform will check this | 
2 | terraform.tfvars | if environment variable is not available then terraform will check this | 
3 | *.auto.tfvars (alphabetical order) | if both are not available then terraform will check this | 
4 | -var or –var-file (command-line flags) | if above 3 are not available then terraform will check this | it will overide previous all.which means this will override any above

> Environment varaiable TF_VAR_  --> if not there then looks for
> terraform.tfvars file if present --> if not there then looks for

> terraform.tfvars.json file if present --> if not there then looks for

> any *.auto.tfvars or *.auto.tfvars.json files --> if not there then looks for

> -var and -var-file on the command line 






