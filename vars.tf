variable "region" {
  type    = "string"
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "193.176.0.0/16"
}
variable "subnet_cidr1" {
  type    = "list"
  default = ["193.176.1.0/26", "193.176.2.0/26"]
}
variable "subnet_cidr2" {
  type    = "list"
  default = ["193.176.3.0/26"]
}
data "aws_availability_zones" "all" {}
variable "public_instances" {
  default = "2"
}
variable "nat_instances" {
  default = "1"
}
variable "keypair" {
  default = "suresh"
}
variable "nat_ami" {
  default = "ami-01623d7b"
}
variable "ami" {
  type = "map"
  default = {
    ap-south-1 = "ami-5a8da735"
    us-west-2  = "ami-0ad99772"
    us-east-1  = "ami-cfe4b2b0"
  }
}
variable "key" {
  type = "map"

  default = {
    us-west-2 = "ec2key"
    us-east-1 = "suresh"
  }
}
variable "ec2_instance_type" {
  default = "t2.micro"
}
