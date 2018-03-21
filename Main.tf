provider "aws" {
        access_key = "AKIAJPVPL4IDSI6QK74A"
        secret_key = "cjoG9E053qQa69nnsBDeTkn1atWt3nd3d23SDpXM/"
        region = "us-east-1d"
}

resource "aws_instance" "instance_Ex" {
        ami = "ami-b374d5a5"
        instance_type = "t2.micro"
}

tags {
    	Name = "SKY01"
  }
  $ terraform init
  $ terraform apply
