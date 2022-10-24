#########################################################################
# - NOT CHANGE - 
# Create key pair for Fortigate instance
#########################################################################

resource "aws_key_pair" "user-xs22-kp" {
  key_name   = "${var.tags["Name"]}-xs22-kp"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcNInIYCjnD3kFWnWUwHyvyWWNF6L9TQ3mHmHIkwDqk+f1Mu0cNA/KdXc/+oJZI9pR3K8SLx3zA3b75ZDEBdjpiZGwkwJXi29uGki9FxBsg1g6H9gk0rYmBvcshyne5RuKwMUR7oXxfCwVQ1T5jKcEYsseVaTvZtThBdGbReAHFQbPpIMlSvpV9GUZCKRoo124S/osLhdaNJhv3UIyVEhMXjvsDyIV7OuGMGMbteUsHGcVU5nP4XRs2mBCpBNeoCY6kjGH+gTglspUaE3WSg4rkIXPKQhTmNM9LJV7fWJJVUPQr9l0U3qcaBo2TUHia4Efj9AaqY358K7VH9tBlOYjReUZIWQcRDmSvoqZvgnBZqW0WfGlpXOPA3DS9yXI6eVUcHl3CRzunDAR3piDW06om68IhlXDpTpDS3/LIpyTVPJNkwIV5VxE5hCvDwh0ThCO5O+6Cv/fgA6z5K7jiaiPyklADGMl1CwCdYCEIuA1R+Y+5VxEmQ4ns/q6zo7CfEk= jvigueras@fortinet.com"
}

