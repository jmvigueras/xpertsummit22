// Create key-pair if not provided
resource "aws_key_pair" "user-kp" {
  count      = var.key-pair_name != null ? 0 : 1
  key_name   = "${var.tags["Name"]}-kp-${random_string.random_str.result}"
  public_key = var.key-pair_rsa-public-key
}

// Create random string for key-pair name
resource "random_string" "random_str" {
  length  = 5
  special = false
  numeric = false
}

