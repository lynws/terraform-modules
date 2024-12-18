data "aws_vpc" "default" {
  default = true
}

data "aws_secretsmanager_secret" "aws_secret" {
  name = var.access_token_secret
}

data "aws_secretsmanager_secret_version" "aws_version" {
  secret_id = data.aws_secretsmanager_secret.aws_secret.id
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}
