variable "environment" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group" {}

resource "aws_instance" "server" {
  ami                    = "ami-0735c191cf914754d"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group]

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }

  tags = {
    Name        = "${var.environment}-server"
    Environment = var.environment
  }
}

output "instance_id" {
  value = aws_instance.server.id
}

output "public_ip" {
  value = aws_instance.server.public_ip
}
