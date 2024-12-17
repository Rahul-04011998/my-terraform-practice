# Specify the provider (AWS)
provider "aws" {
  region = "ap-south-1"  # Set the region for your EC2 instance
}

# Create an EC2 instance
resource "aws_instance" "terraform_instance" {
  ami           = "ami-0614680123427b75e"  # Example AMI ID for Amazon Linux 2 (replace with your desired AMI ID)
  instance_type = "t2.micro"               # Instance type

  # Request a public IP address
  associate_public_ip_address = true

  tags = {
    Name = "terraform-instance"  # Tag to give your instance a name
  }

  # Optional: Allow SSH access by adding a security group
  security_groups = ["default"]

  # Optional: SSH key name for access to the instance (replace with your key name)
  key_name = "rhcsa-server"
}

# Output the public IP address of the EC2 instance
output "instance_public_ip" {
  value = aws_instance.terraform_instance.public_ip
}

  
