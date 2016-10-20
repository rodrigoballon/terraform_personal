provider "aws" {
  region                   = "${var.region}"
  shared_credentials_file  = "/etc/secrets/.aws/credentials_personal"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.example.id}"
    depends_on = ["aws_instance.example"]
}
