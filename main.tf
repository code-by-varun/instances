 data "terraform_remote_state" "network_details" {
   backend = "s3"
   config = {
     bucket = "student.1-varun-bucket"
     key = "student.1-network-state"
     region = var.region
  }
 } 

 resource "aws_instance" "my_vm" {
  ami = var.ami
 subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
 key_name = data.terraform_remote_state.network_details.outputs.key_name
 vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id_array
 instance_type = var.instance
 tags = {
     Name = "student.1-vm1"
   }
 }
