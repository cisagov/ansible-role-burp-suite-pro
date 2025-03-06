# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "burp_suite_pro_bucket" {
  description = "The name of the S3 bucket where the Burp Suite Pro installer lives."
  type        = string
}

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  type        = string
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to deploy into (e.g. us-east-1)."
  type        = string
}

variable "burp_suite_pro_objects" {
  default = [
    "burpsuite_pro_linux.sh",
  ]
  description = "The Burp Suite Pro installer object(s) inside the bucket."
  type        = list(string)
}

variable "tags" {
  default = {
    Team        = "VM Fusion - Development"
    Application = "ansible-role-burp-suite-pro testing"
  }
  description = "Tags to apply to all AWS resources created"
  type        = map(string)
}
