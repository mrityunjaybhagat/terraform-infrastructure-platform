data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.bastion_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = merge(
    var.common_tags,
    {
      Name = "${var.name_prefix}-bastion"
      Role = "Bastion"
    }
  )
}

resource "aws_instance" "private" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_ec2_sg_id]
  key_name               = var.key_name

  tags = merge(
    var.common_tags,
    {
      Name = "${var.name_prefix}-private-ec2"
      Role = "PrivateApp"
    }
  )
}