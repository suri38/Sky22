[
        provider "aws" {
        access_key = "AKIAIOBWVSLOXKKG6RNBQ"
        secret_key = "4O28N92r2bwnEKib4+3gFYQjeXGwDbkHNoeoLPR5B"
        region = "us-east-1d"
        }

resource "aws_instance" "instance_Ex" {
        ami = "ami-408c7f28"
        instance_type = "t2.micro"

        tags {
        Name = "SKY01"
             }
         }
 ]
