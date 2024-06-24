resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.allow_http.id]

  user_data = base64encode(templatefile("${path.module}/config/template.sh.tpl", {
    image_name         = var.image_name
    tag                = var.tag
    dockerhub_username = var.dockerhub_username
    dockerhub_token    = jsondecode(data.aws_secretsmanager_secret_version.aws_version.secret_string)["HUB_PASS"]
  }))
}
