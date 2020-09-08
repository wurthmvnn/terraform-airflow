

provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
  profile = "default"
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "ssh-access"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-access"
  }
}

resource "aws_instance" "dev" {

  count         = 1
  ami           = "ami-0bcc094591f354be2"
  instance_type = "t2.micro"
  key_name      = "teste"
  tags = {
    Name = "maquina-1"
  }
  vpc_security_group_ids = ["${aws_security_group.ssh-access.id}"]

  provisioner "file" {
    source      = "./scripts/script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "file" {
    source      = "./docker/docker-compose.yml"
    destination = "/tmp/docker-compose.yml"
  }

  provisioner "file" {
    source      = "./dags/initial_dag.py"
    destination = "/tmp/initial_dag.py"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.keyPath)
    host        = self.public_ip
  }
}






