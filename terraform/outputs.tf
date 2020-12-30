output "access_key" {
  value       = module.user.access_key
  description = "The IAM access key associated with the CI IAM user created by this module."
  sensitive   = true
}

output "production_bucket_policy" {
  value       = module.production_bucket_access.policy
  description = "The IAM policy that allows the CI user to read certain objects in the production third-party S3 bucket."
}

output "production_role" {
  value       = module.user.production_role
  description = "The IAM role that the CI user can assume to read SSM parameters in the production account."
}

output "staging_bucket_policy" {
  value       = module.staging_bucket_access.policy
  description = "The IAM policy that allows the CI user to read certain objects in the staging third-party S3 bucket."
}

output "staging_role" {
  value       = module.user.staging_role
  description = "The IAM role that the CI user can assume to read SSM parameters in the staging account."
}

output "user" {
  value       = module.user.user
  description = "The CI IAM user created by this module."
}
