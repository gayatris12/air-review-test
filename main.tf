terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "5.100.0" }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "Bastion access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_policy" "deployer" {
  name = "deployer"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "*", Resource = "*" }]
  })
}
