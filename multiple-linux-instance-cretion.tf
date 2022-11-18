provider "aws" {
  profile    = "Terraform-user"
  access_key = "AKIAXRBAMKA2T2JG3CDR"
  secret_key = "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"
  region     = "eu-west-1"
}

resource "aws_instance" "linux" {
  ami = "ami-01cae1550c0adea9c"
  tags = {
    Name = "linux-PC"
  }
  instance_type   = "t2.micro"
  key_name        = "Terraform-key"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
  count           = 5
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  tags = {
    Name = "ALLOW_SSH"
  }
  description = "allow ssh traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
