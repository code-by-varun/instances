variable "instance" {
 default = "t3.micro"
}

variable "region" {
  default = "ap-south-1" 
}

variable "ami" {
 default = "ami-053b12d3152c0cc71" 
}

variable "profile" {
 default = "student.1"
}

variable "webserver_prefix" {
 default = "student.1-webserver-vm"
}

variable "loadbalancer_prefix" {
 default = "student.1-loadbalancer-vm"
}
