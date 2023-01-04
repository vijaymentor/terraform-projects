output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.ec2_example.public_ip
}

output "no_of_cpu_cores" {
  value = aws_instance.ec2_example.cpu_core_count
}


output "instance-type" {
  value = aws_instance.ec2_example.instance_type
}

output "ipaddress" {
  value = aws_instance.ec2_example.private_ip
}



output "howmuch-cpu-thread" {
  value = aws_instance.ec2_example.cpu_threads_per_core
}

output "what-is-thesubnet-id" {
  value = aws_instance.ec2_example.subnet_id
}
