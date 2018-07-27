resource "aws_vpc" "myvpc1" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "VPC-1"
  }
}
resource "aws_subnet" "mysubnet" {
  vpc_id = "${aws_vpc.myvpc1.id}"
  cidr_block = "${var.subnet_cidr}"
}
