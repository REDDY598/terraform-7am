resource "aws_subnet" "private" {
  count             = "${length(var.subnet_cidr2)}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  cidr_block        = "${element(var.subnet_cidr2,count.index)}"
  availability_zone = "${data.aws_availability_zones.all.names[count.index]}"
  depends_on        = ["aws_vpc.myvpc"]

  tags {
    Name = "PrivateSubnet-${count.index + 1}"
  }
}

resource "aws_route_table" "custom_rt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.nat-servers.id}"
  }

  tags {
    Name = "custom-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.private.id}"
  route_table_id = "${aws_route_table.custom_rt.id}"
}
