##############################################################################################################
# VM LINUX server
##############################################################################################################
// Create and attach the Elastic Public IPs to interface public interface
resource "aws_eip" "eip-server_public" {
  vpc               = true
  network_interface = local.eni-server["id"]
  tags              = local.tags
}

// Server in subnet Servers
resource "aws_instance" "server" {
  ami           = data.aws_ami.server_ami-amazon.id
  instance_type = "t2.micro"
  key_name      = local.key-pair_name
  user_data     = data.template_file.data-server_user-data.rendered
  network_interface {
    device_index         = 0
    network_interface_id = local.eni-server["id"]
  }

  tags = local.tags
}

// Retrieve AMI info
data "aws_ami" "server_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "server_ami-amazon" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}


// Create user-data for server
data "template_file" "data-server_user-data" {
  template = file("./templates/server_user-data.tpl")
  vars = {
    user = local.tags["Owner"]
  }
}