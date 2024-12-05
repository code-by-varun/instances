resource "aws_instance" "my_vm" {
  count                  = var.instance_count
  ami                    = var.ami
  subnet_id              = var.subnet_id
  instance_type          = var.instance
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  tags                   = var.tags


  provisioner "remote-exec" {
    connection {
      host        = self.public_ip
      type        = "ssh"   
      user        = "ubuntu"
      agent       = false
      private_key = file("/home/varun/terrafrom_base/keys/student.1-vm.key")
    }
    inline = [
      "sudo apt install -y python3"
    ]
  }
}
