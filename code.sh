#!/bin/bash

yum install httpd -y
chkconfig httpd on
echo '<h1> Welcome to Apache Server By Terraform </h1>' > /var/www/html/index.html
service httpd start
