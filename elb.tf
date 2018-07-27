# Create a new load balancer
resource "aws_elb" "bar" {
  name               = "wipro-elb"
  subnets         = ["${aws_subnet.public.*.id}"]
  security_groups = ["${aws_security_group.wipro_sg.id}"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = ["${aws_instance.public-servers.*.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  depends_on = ["aws_subnet.public"]
  depends_on = ["aws_security_group.web_sg"]
  depends_on = ["aws_instance.public-servers"]
  tags {
    Name = "wipro-elb"
  }
}
