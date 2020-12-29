# Create the test user
module "user" {
  source = "github.com/cisagov/molecule-iam-user-tf-module"

  providers = {
    aws                                    = aws.users
    aws.images-production-provisionaccount = aws.images_production_provisionaccount
    aws.images-staging-provisionaccount    = aws.images_staging_provisionaccount
    aws.images-production-ssm              = aws.images_production_ssm
    aws.images-staging-ssm                 = aws.images_staging_ssm
  }

  entity         = "ansible-role-burp-suite-pro"
  ssm_parameters = ["/github/personal_authorization_token"]

  tags = var.tags
}

# Attach third-party S3 bucket read-only policy to the production
# EC2AMICreate role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_production" {
  provider = aws.images_production_provisionaccount

  policy_arn = module.production_bucket_access.policy.arn
  role       = module.user.production_role.name
}

# Attach third-party S3 bucket read-only policy to the staging
# EC2AMICreate role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_staging" {
  provider = aws.images_staging_provisionaccount

  policy_arn = module.staging_bucket_access.policy.arn
  role       = module.user.staging_role.name
}
