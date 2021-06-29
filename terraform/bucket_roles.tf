# Create the roles that allow read-only access to the particular S3
# objects that are required by this Ansible role
module "production_bucket_access" {
  source = "github.com/cisagov/s3-read-role-tf-module"
  providers = {
    aws = aws.images_production_thirdparty
  }

  account_ids = [data.aws_caller_identity.current.account_id]
  entity_name = module.user.user.name
  role_name   = "ThirdPartyBucketRead-${module.user.user.name}"
  s3_bucket   = var.production_bucket_name
  s3_objects  = var.production_objects
}

module "staging_bucket_access" {
  source = "github.com/cisagov/s3-read-role-tf-module"
  providers = {
    aws = aws.images_staging_thirdparty
  }

  account_ids = [data.aws_caller_identity.current.account_id]
  entity_name = module.user.user.name
  role_name   = "ThirdPartyBucketRead-${module.user.user.name}"
  s3_bucket   = var.staging_bucket_name
  s3_objects  = var.staging_objects
}
