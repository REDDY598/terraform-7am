 output "instance_ips" {
   value = ["${aws_instance.public-servers.*.public_ip}"]
 }
 output "ELB-DNS" {
   value = ["${aws_elb.bar.dns_name}"]
 }

# variable "cidr1" {}
# resource "aws_vpc" "myvpc" {
#   cidr_block = "${var.cidr}"
#   provisioner "local-exec" {
#       command = "echo ${aws_vpc.myvpc.id} > ids.txt"
#     }
# }
# resource "aws_subnet" "mysubnet" {
#   vpc_id = "${aws_vpc.myvpc.id}"
#   cidr_block = "${var.cidr1}"
#   provisioner "local-exec" {
#       command = "echo ${aws_subnet.mysubnet.id} >> ids.txt"
#     }
# }

