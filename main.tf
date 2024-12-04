 data "terraform_remote_state" "network_details" {
   backend = "s3"
   config = {
     bucket = "student.1-varun-bucket"
     key = "student.1-network-state"
     region = "ap-south-1"
  }
 }
