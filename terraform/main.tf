data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${local.prefix}-key"
  public_key = tls_private_key.private_key.public_key_openssh
}

resource "aws_eip" "elastic_ip" {
  instance = aws_instance.instance.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.xlarge"
  key_name      = aws_key_pair.generated_key.key_name

  tags = {
    Name = "${local.prefix}-instance"
  }
}
