data "terraform_remote_state" "network_details" {
  backend = "s3"
  config = {
    bucket = "student.1-varun-bucket"
    key    = "student.1-network-state"
    region = var.region
  }
}

module "webserver" {
  source = "./modules/linux_node"
  ami    = "ami-053b12d3152c0cc71"
  instance = "t3.micro"
  key_name = data.terraform_remote_state.network_details.outputs.key_name
  subnet_id = data.terraform_remote_state.network_details.outputs.my_subnet
  vpc_security_group_ids = data.terraform_remote_state.network_details.outputs.security_group_id_array
  tags = {
    Name = "student.1-vm1"
  }
}

