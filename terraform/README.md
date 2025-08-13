# Test User #

This directory consists of [Terraform](https://www.terraform.io/) code
that is used to create a test user.  This test user is in turn used by
our CI/CD pipeline to test the Ansible role.

See the [overall project documentation](../README.md) for a detailed
description of how this code is intended to be used.

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.1 |
| aws | ~> 6.7 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 6.7 |
| aws.images\_provisionaccount | ~> 6.7 |
| terraform | n/a |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| bucket\_access | github.com/cisagov/s3-read-role-tf-module | n/a |
| user | github.com/cisagov/molecule-iam-user-tf-module | n/a |

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_role_policy_attachment.bucket_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [terraform_remote_state.images](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.images_ssm](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| burp\_suite\_pro\_bucket | The name of the S3 bucket where the Burp Suite Pro installer lives. | `string` | n/a | yes |
| burp\_suite\_pro\_objects | The Burp Suite Pro installer object(s) inside the bucket. | `list(string)` | ```[ "burpsuite_pro_linux.sh" ]``` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | ```{ "Application": "ansible-role-burp-suite-pro testing", "Team": "VM Fusion - Development" }``` | no |
| terraform\_state\_bucket | The name of the S3 bucket where Terraform state is stored. | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| access\_key | The IAM access key associated with the CI IAM user created by this module. |
| bucket\_access\_policy | The IAM policy that allows the CI user to read certain objects in the third-party S3 bucket. |
| role | The IAM role that the CI user can assume to read SSM parameters in the Images account. |
| user | The CI IAM user created by this module. |
<!-- END_TF_DOCS -->
