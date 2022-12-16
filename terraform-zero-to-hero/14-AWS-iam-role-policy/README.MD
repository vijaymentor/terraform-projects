# Attach IAM role policy


- IAM is global service
- Role is IAM identity that has specific permission
- Role doesnt have long term credentials.Like IAM user has .
- Role can be assumed by service,user or applications.
- When role is assumed,it provides temporary credentials.



we are going to create below

- create VPC
- create subnet
- create security group
- create policy document
- create role and attach policy document to the role.
- create ec2 instance with apache web server.Attach the role to the ec2 instance.

