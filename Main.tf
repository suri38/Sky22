provider "aws" {
        access_key = "AKIAIOBWVSLOXKKG6RNBQ"
        secret_key = "4O28N92r2bwnEKib4+3gFYQjeXGwDbkHNoeoLPR5B"
        region = "us-east-1d"
        }


 
resource "aws_launch_configuration" "sky_ASG" {
        ami = "ami-408c7f28"
        instance_type = "t2.micro"
        security_groups = ["${aws_security_group.instance.id}"]
            
        lifecycle{
                create_before_destroy = true
                }
        }       

resource "aws_security_group" "new_insta"{
        name = "sky_sec_insta"
        
        ingress{
               from_port = "${var.server_port}"
                to_port = "${var.server_port}"
                protocol= "tcp"
                cidr_blocks = ["0.0.0.0/0] 
                }
        
        lifecycle{
                create_before_destroy = true
                }
        }

data "aws_availability_zones" "all" {}

resource "aws_autoscaling_group" "sky_ASG"{
                launch_configuration = "${aws_launch_configuration.sky_ASG.id}"
                min_size = 2
                max_size = 4

        tag{
                key="name"
                value ="new_asg"
                propagate_at_launch = true
            }
        }


resource "aws_elb" "sky_elb" {
        name="new_asg"
        availability_zones = ["${data.aws_availability_zones.all.names}"]
        instances = ["${aws_instance.sky.*.id}"]
        listener{
               lb_port=80
               lb_protocol="http"
               instance_port="${var.server_port}"
               instance_protocol="http"
              }
        }
