provider "aws" {
  profile    = "Terraform-user"
  access_key = "AKIAXRBAMKA2T2JG3CDR"
  secret_key = "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"
  region     = "eu-west-1"
}

resource "aws_instance" "windows" {
  ami = "ami-07fc612d98a90981b"
  tags = {
    Name = "Windows-PC"
  }
  instance_type   = "t2.micro"
  key_name        = "Terraform-key"
  security_groups = ["${aws_security_group.allow_rdp.name}"]
}

resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "allow rdp traffic"
  tags = {
    Name = "ALLOW_RDP"
  }
  ingress {
    from_port   = "3389"
    to_port     = "3389"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

