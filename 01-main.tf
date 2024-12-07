provider "aws" {
  # Determines AWS account from AWS_PROFILE env var
  # Determines AWS region from AWS_REGION env var
}

data "aws_ami" "ubuntu_22_04" {
  # The official owner ID for Canonical (Ubuntu) AMIs
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "is-public"
    values = ["true"]
  }
}
