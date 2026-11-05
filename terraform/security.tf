resource "aws_security_group" "app_sg" {
  name        = "${var.project_name}-sg"
  description = "Security group for employee application EC2"
  vpc_id      = aws_vpc.main.id

  # SSH access - restricted to user's IP
  dynamic "ingress" {
    for_each = var.allowed_ssh_cidr != "" ? [1] : []

    content {
      description = "SSH access"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.allowed_ssh_cidr]
    }
  }

  # Public frontend access
  ingress {
    description = "Frontend NodePort"
    from_port   = 30080
    to_port     = 30080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}
