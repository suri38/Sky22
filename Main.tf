provider "aws" {
        access_key = "AKIAIOBWVSLOXKG6RNBQ"
        secret_key = "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"
        region = "us-east-1d"
        }

resource "aws_instance" "instance_Ex" {
        ami = "ami-b374d5a5"
        instance_type = "t2.micro"

        tags {
        Name = "SKY01"
             }
         }
