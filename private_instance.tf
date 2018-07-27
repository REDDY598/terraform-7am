resource "aws_instance" "private-servers" {
  count                  = 1
  ami                    = "${lookup(var.ami,var.region)}"
  instance_type          = "${var.ec2_instance_type}"
  subnet_id              = "${aws_subnet.private.id}"
  vpc_security_group_ids = ["${aws_security_group.wipro_sg.id}"]
  key_name               = "suresh"
  depends_on             = ["aws_subnet.private"]
  depends_on             = ["aws_security_group.web_sg"]

  tags {
    Name = "PrivateServer"
  }
}
