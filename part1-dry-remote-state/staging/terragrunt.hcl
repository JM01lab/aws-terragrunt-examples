# Staging environment
# Inherits remote state from root terragrunt.hcl

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  environment   = "staging"
  instance_type = "t2.small"
}
