# Create the test user
module "user" {
  source = "github.com/cisagov/molecule-iam-user-tf-module"

  providers = {
    aws                         = aws.users
    aws.images-provisionaccount = aws.images_provisionaccount
    aws.images-ssm              = aws.images_ssm
  }

<<<<<<< HEAD
  entity = "ansible-role-burp-suite-pro"
  # The TF module will error if we don't put at least one value here.
  # This build user does not need to access any SSM parameters, so we
  # just place a dummy value here.
  ssm_parameters = ["/dummy/value"]
}

# Attach third-party S3 bucket read-only policy to the test user role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread" {
  provider = aws.images_provisionaccount

  policy_arn = module.bucket_access.policy.arn
  role       = module.user.role.name
=======
  entity = "skeleton-ansible-role-with-test-user"

  # If necessary, provide a list of SSM parameters that the test user needs to
  # be able to read
  # ssm_parameters = ["/example/parameter"]
>>>>>>> 26819a903c52b39dce7b3673f54402d3d281fba3
}
