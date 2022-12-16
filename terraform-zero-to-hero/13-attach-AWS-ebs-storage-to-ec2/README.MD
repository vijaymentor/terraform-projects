# create EC2 Instances and attach EBS volume to the EC2 instance

> we will create the below

- create VPC
- create EC2 instance with userdate section to install apache webserver in that ec2 machine
- create security group and attach it to the ec2 machine.
- create EBS standard volume and attach it to the EC2 instance

- copy from single webserver code [03-deploy-single-web-server-using-parameter]

- explain each .tf file

- terraform init
- terraform validate
- terraform plan
- terraform apply


- now 	web.myr53zone.com in route 53 has been created.


- loging ot the ec2 machine

- perform the below commands

```
df -m
lsblk
pvcreate /dev/xvdd
vgcreate vg-web /dev/xvdd
lvcreate -n web-lv -L 10 vg-web
mkfs -t ext4 /dev/vg-web/web-lv
mkdir /soft
mount /dev/vg-web/web-lv /soft
df -m
```



- note:  without these below 2 options try to execute and create
```
  stop_instance_before_detaching = true
  force_detach = true
```

- first add stop_instance_before_detaching = true option and try to create and destroy
- then disable stop_instance_before_detaching = true option and add force_detach = true option ...then try to execute apply and destroy...Check it now.







