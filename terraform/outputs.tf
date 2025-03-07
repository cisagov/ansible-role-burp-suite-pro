output "access_key" {
  description = "The IAM access key associated with the CI IAM user created by this module."
  sensitive   = true
  value       = module.user.access_key
}

output "bucket_access_policy" {
  value       = module.bucket_access.policy
  description = "The IAM policy that allows the CI user to read certain objects in the third-party S3 bucket."
}

output "role" {
  description = "The IAM role that the CI user can assume to read SSM parameters in the Images account."
  value       = module.user.role
}

output "user" {
  description = "The CI IAM user created by this module."
  value       = module.user.user
}
