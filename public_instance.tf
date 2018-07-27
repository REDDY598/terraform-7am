resource "aws_instance" "public-servers" {
  count                  = "${var.public_instances}"
  ami                    = "${lookup(var.ami,var.region)}"
  instance_type          = "${var.ec2_instance_type}"
  subnet_id              = "${element(aws_subnet.public.*.id,count.index)}"
  vpc_security_group_ids = ["${aws_security_group.wipro_sg.id}"]
  key_name               = "suresh"
  depends_on             = ["aws_subnet.public"]
  depends_on             = ["aws_security_group.web_sg"]
  user_data              = "${file("./code.sh")}"

  tags {
    Name = "PublicServer-${count.index+1}"
  }
}
