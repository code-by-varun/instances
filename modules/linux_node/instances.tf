resource "aws_instance" "my_vm" {
  count                  = "2"
  ami                    = var.ami
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  instance_type          = var.instance
  tags = {
    Name = "var.tags"
  }
}

