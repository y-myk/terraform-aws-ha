resource "aws_security_group" "sg-Internet" {
  name        = format("%s-sg-Internet-%s", var.prefix, random_id.id.hex)
  description = "Internet facing rules"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Home"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.adminSrcRange, var.cidr]
  }

  ingress {
    description = "TCP 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "UDP 443"
    from_port   = 443
    to_port     = 443
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "DNS"
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format("%s-sg-Internet-%s", var.prefix, random_id.id.hex)
  }
}

resource "aws_security_group" "sg-main" {
  name        = format("%s-sg-main-%s", var.prefix, random_id.id.hex)
  description = "main rules"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Home"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["69.251.248.77/32"]
  }

  ingress {
    description = "VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format("%s-sg-main-%s", var.prefix, random_id.id.hex)
  }
}