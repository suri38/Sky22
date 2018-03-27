provider "aws" {
        access_key = "AKIAIOBWVSLOXKKG6RNBQ"
        secret_key = "4O28N92r2bwnEKib4+3gFYQjeXGwDbkHNoeoLPR5B"
        region = "us-east-1d"
        }


resource "aws_elb" "sky" {
        name="sky_elb"
        availability_zones = ["${data.aws_availability_zones.all.names}"]
        instances = ["${aws_instance.sky.*.id}"]
        listener{
               lb_port=80
               lb_protocol="http"
               instance_port="${var.server_port}"
               instance_protocol="http"
              }
        }

 
resource "aws_instance" "sky" {
        count = "4"
        ami = "ami-408c7f28"
        instance_type = "t2.micro"
             }       
