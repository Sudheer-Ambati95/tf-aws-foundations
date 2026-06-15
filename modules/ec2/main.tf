resource "aws_iam_role" "ec2_role" {

  name = "${var.environment}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name       = "${var.environment}-ec2-role"
    PatchGroup = "app-servers"
  }
}

resource "aws_iam_role_policy_attachment" "ssm" {

  role = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_profile" {

  name = "${var.environment}-ec2-profile"

  role = aws_iam_role.ec2_role.name
}

data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_launch_template" "app" {

  name_prefix = "${var.environment}-app-"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  monitoring {
    enabled = true
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  block_device_mappings {

    device_name = "/dev/xvda"

    ebs {
      encrypted   = true
      volume_size = 20
      volume_type = "gp3"
    }
  }

  user_data = base64encode(<<EOF
#!/bin/bash
set -euxo pipefail

dnf update -y

dnf install -y amazon-ssm-agent

systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent
EOF
  )

  tag_specifications {

    resource_type = "instance"

    tags = {
      Name        = "${var.environment}-app-server"
      Environment = var.environment
      Project     = "aws-devops-platform"
      ManagedBy   = "terraform"
    }
  }
}

resource "aws_instance" "app" {

  subnet_id = var.private_subnet_id

  vpc_security_group_ids = [
    var.app_security_group_id
  ]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  tags = {
    Name        = "${var.environment}-app-server"
    Environment = var.environment
    Project     = "aws-devops-platform"
    ManagedBy   = "terraform"
  }
}

