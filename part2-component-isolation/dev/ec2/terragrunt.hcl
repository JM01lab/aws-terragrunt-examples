# EC2 component — depends on VPC and Security Groups

include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    subnet_id = "subnet-00000000"
  }

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

dependency "security_groups" {
  config_path = "../security-groups"

  mock_outputs = {
    sg_id = "sg-00000000"
  }

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

inputs = {
  environment    = "dev"
  instance_type  = "t2.micro"
  subnet_id      = dependency.vpc.outputs.subnet_id
  security_group = dependency.security_groups.outputs.sg_id
}
