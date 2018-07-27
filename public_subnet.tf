resource "aws_subnet" "public" {
  count                   = "${length(var.subnet_cidr1)}"
  vpc_id                  = "${aws_vpc.myvpc.id}"
  cidr_block              = "${element(var.subnet_cidr1,count.index)}"
  availability_zone       = "${data.aws_availability_zones.all.names[count.index]}"
  map_public_ip_on_launch = true
  depends_on              = ["aws_vpc.myvpc"]

  tags {
    Name = "PublicSubnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id     = "${aws_vpc.myvpc.id}"
  depends_on = ["aws_vpc.myvpc"]

  tags {
    Name = "wipro-igw"
  }
}

resource "aws_default_route_table" "r" {
  default_route_table_id = "${aws_vpc.myvpc.default_route_table_id}"
  depends_on             = ["aws_vpc.myvpc"]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "Default-RT"
  }
}
resource "aws_route_table_association" "ab" {
  subnet_id      = "${aws_subnet.public.*.id[count.index]}"
  route_table_id = "${aws_default_route_table.r.id}"
}
