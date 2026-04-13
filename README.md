# AWS Terragrunt Examples

Code companion for the Dev.to article series **"Mastering Terragrunt on AWS"**.

This repository demonstrates how to use Terragrunt to manage 
Terraform configurations following the DRY (Don't Repeat Yourself) principle.

## Article Series

| Part | Topic | Link |
|---|---|---|
| Part 1 | DRY Remote State with Terragrunt | [Read on Dev.to](#) |
| Part 2 | Component Isolation with Dependency Blocks | Coming soon |

## Prerequisites

- Terraform >= 0.12
- Terragrunt installed — [installation guide](https://terragrunt.gruntwork.io/docs/getting-started/install/)
- AWS CLI configured (`aws configure`)
- An AWS account with permissions to create S3 and DynamoDB resources

## Repository Structure

aws-terragrunt-examples/ ├── part1-dry-remote-state/ # Part 1 — DRY Remote State └── part2-component-isolation/ # Part 2 — Coming soon
