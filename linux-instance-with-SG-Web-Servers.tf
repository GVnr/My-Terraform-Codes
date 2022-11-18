provider "aws" {
  profile    = "Terraform-user"
  access_key = "AKIAXRBAMKA2T2JG3CDR"
  secret_key = "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"
  region     = "eu-west-1"
}

resource "aws_instance" "linux" {
  ami       = "ami-01cae1550c0adea9c"
  user_data = file("script.sh")
  tags = {
    Name = "linux-PC"
  }
  instance_type   = "t2.micro"
  key_name        = "Terraform-key"
  count           = 5
  security_groups = ["${aws_security_group.allow_ssh_http.name}"]
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "allow ssh & http traffic"
  tags = {
    Name = "ALLOW_SSH_HTTP"
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::0/0"]
  }
}
















