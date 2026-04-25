# Root Terragrunt configuration
# Remote state defined once — shared across all environments

remote_state {
  backend = "s3"

  config = {
    bucket         = "your-terraform-state-bucket"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-west-2"
    use_lockfile   = true
    encrypt        = true
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

inputs = {
  region = "us-west-2"
}
