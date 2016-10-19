provider "aws" {
  region                   = "us-east-1"
  shared_credentials_file  = "/Users/rballon/.aws/credentials_personal"
}

resource "aws_instance" "example" {
  ami           = "ami-13be557e"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}
