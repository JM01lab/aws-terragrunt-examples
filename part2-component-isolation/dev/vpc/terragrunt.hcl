# VPC component — no dependencies
# First to be deployed

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  environment = "dev"
  vpc_cidr    = "10.0.0.0/16"
}
