 data "terraform_remote_state" "network_details" {
   backend = "s3"
   config = {
     bucket = "student.1-varun-bucket"
     key = "student.1-network-state"
     region = "ap-south-1"
  }
 } 

 resource "aws_instance" "my_vm" {
  ami = "ami-053b12d3152c0cc71"
 subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
 instance_type = "t2.micro"
 tags = {
     Name = "student.1-vm1"
   }
 }