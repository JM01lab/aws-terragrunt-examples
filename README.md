# AWS Terragrunt Examples

Code companion for the Dev.to article series **"Mastering Terragrunt on AWS"**.

This repository demonstrates how to use Terragrunt to manage Terraform configurations following the DRY (Don't Repeat Yourself) principle — so you never have to copy-paste your remote state backend configuration across environments again.

## Article Series

| Part | Topic | Link |
| :--- | :--- | :--- |
| Part 1 | Stop Copy-Pasting Terraform State Configs: Use Terragrunt Instead | [Read on Dev.to](https://dev.to/jeancy/stop-copy-pasting-terraform-state-configs-use-terragrunt-instead-ana) |
| Part 2 | Component Isolation with Dependency Blocks | Coming soon |

## Prerequisites

Before getting started, make sure you have the following:

- Basic knowledge of Terraform (HCL syntax, resources, variables, remote state)
- Terraform >= 0.12 installed — [Download](https://developer.hashicorp.com/terraform/install)
- Terragrunt installed — [Installation guide](https://terragrunt.gruntwork.io/docs/getting-started/quick-start/#install-terragrunt)
- AWS CLI configured with your credentials (`aws configure`)
- An AWS account with sufficient permissions to create S3 buckets and DynamoDB tables
- Visual Studio Code with the [HashiCorp Terraform extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform) for syntax highlighting and autocompletion

## Repository Structure

```
aws-terragrunt-examples/
├── terragrunt.hcl                  # Root — remote state defined once here
├── part1-dry-remote-state/
│   ├── dev/
│   │   └── terragrunt.hcl          # Only what changes per environment
│   ├── staging/
│   │   └── terragrunt.hcl
│   └── prod/
│       └── terragrunt.hcl
└── part2-component-isolation/      # Coming soon
```

## Getting Started

Clone the repository and navigate to the relevant part:

```bash
git clone https://github.com/YOUR_USERNAME/aws-terragrunt-examples.git
cd aws-terragrunt-examples/part1-dry-remote-state
```

### Deploy all environments at once

```bash
terragrunt run-all apply
```

Terragrunt will automatically detect all `terragrunt.hcl` files, initialize each environment, create the S3 bucket and DynamoDB table if they don't exist, and deploy everything in the correct order.

### Target a specific environment

```bash
# Deploy only dev
cd dev/
terragrunt apply

# Check outputs across all environments
terragrunt run-all output

# Destroy all environments
terragrunt run-all destroy
```

## Key Concepts

**`find_in_parent_folders()`** — Automatically searches parent directories for the root `terragrunt.hcl`, allowing each environment to inherit the shared configuration without hardcoding paths.

**`path_relative_to_include()`** — Makes the S3 state key dynamic per environment:

| Environment folder | Generated state key |
| :--- | :--- |
| `dev/` | `dev/terraform.tfstate` |
| `staging/` | `staging/terraform.tfstate` |
| `prod/` | `prod/terraform.tfstate` |

**`generate` block** — Automatically generates a `backend.tf` file in each environment folder before running Terraform. No manual backend files needed.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

## Author

**Jeancy Joachim Mukaka** — AWS Community Builder (Developer Tools)

[Dev.to](https://dev.to/jeancy) | [Medium](https://medium.com/@jeancymukaka6?source=home---two_column_layout_nav-----------------------------------------) | [LinkedIn](www.linkedin.com/in/jeancy-joachim-mukaka-495411227)
