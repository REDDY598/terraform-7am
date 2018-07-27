resource "aws_instance" "nat-servers" {
  count                       = "${var.nat_instances}"
  ami                         = "${var.nat_ami}"
  instance_type               = "${var.ec2_instance_type}"
  subnet_id                   = "${aws_subnet.public.*.id[0]}"
  vpc_security_group_ids      = ["${aws_security_group.wipro_sg.id}"]
  key_name                    = "${var.keypair}"
  associate_public_ip_address = "true"
  source_dest_check           = "false"
  depends_on                  = ["aws_subnet.public"]
  depends_on                  = ["aws_security_group.web_sg"]

  tags {
    Name = "Nat_Instance"
  }
}
