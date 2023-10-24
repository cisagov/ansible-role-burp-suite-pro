# ansible-role-burp-suite-pro #

[![GitHub Build Status](https://github.com/cisagov/ansible-role-burp-suite-pro/workflows/build/badge.svg)](https://github.com/cisagov/ansible-role-burp-suite-pro/actions)
[![CodeQL](https://github.com/cisagov/ansible-role-burp-suite-pro/workflows/CodeQL/badge.svg)](https://github.com/cisagov/ansible-role-burp-suite-pro/actions/workflows/codeql-analysis.yml)

This is an Ansible role for installing [Burp Suite
Professional](https://portswigger.net/burp/pro).

## Pre-requisites ##

In order to execute the Molecule tests for this Ansible role in GitHub
Actions, a build user must exist in AWS. The accompanying Terraform
code will create the user with the appropriate name and
permissions. This only needs to be run once per project, per AWS
account. This user can also be used to run the Molecule tests on your
local machine.

Before the build user can be created, you will need a profile in your
AWS credentials file that allows you to read and write your remote
Terraform state.  (You almost certainly do not want to use local
Terraform state for this long-lived build user.)  If the build user is
to be created in the CISA COOL environment, for example, then you will
need the `cool-terraform-backend` profile.

The easiest way to set up the Terraform remote state profile is to
make use of our
[`aws-profile-sync`](https://github.com/cisagov/aws-profile-sync)
utility. Follow the usage instructions in that repository before
continuing with the next steps, and note that you will need to know
where your team stores their remote profile data in order to use
[`aws-profile-sync`](https://github.com/cisagov/aws-profile-sync).

To create the build user, follow these instructions:

```console
cd terraform
terraform init --upgrade=true
terraform apply
```

Once the user is created you will need to update the [repository's
secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)
with the new encrypted environment variables. This should be done
using the
[`terraform-to-secrets`](https://github.com/cisagov/development-guide/tree/develop/project_setup#terraform-iam-credentials-to-github-secrets-)
tool available in the [development
guide](https://github.com/cisagov/development-guide). Instructions for
how to use this tool can be found in the ["Terraform IAM Credentials
to GitHub Secrets"
section](https://github.com/cisagov/development-guide/tree/develop/project_setup#terraform-iam-credentials-to-github-secrets-).
of the Project Setup README.

If you have appropriate permissions for the repository you can view
existing secrets on the [appropriate
page](https://github.com/cisagov/ansible-role-burp-suite-pro/settings/secrets)
in the repository's settings.

## Requirements ##

None.

## Role Variables ##

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| burp\_suite\_pro\_install\_directory | The directory where Burp Suite Pro should be installed. | `/usr/local/BurpSuitePro` | No |
| burp\_suite\_pro\_installer\_object\_name | The name of the S3 object corresponding to the Burp Suite Pro Linux installer. | `burpsuite\_pro\_linux.sh` | No |
| burp\_suite\_pro\_license\_object\_name | The name of the S3 object corresponding to the Burp Suite Pro license. | `burpsuite\_pro.license` | No |
| burp\_suite\_pro\_symlinks_directory | The directory where symlinks to the Burp Suite Pro executables should be created. | `/usr/local/bin` | No |
| burp\_suite\_pro\_third\_party\_bucket\_name | The name of the AWS S3 bucket where third-party software is located. | `cisa-cool-third-party-production` | No |
| burp\_suite\_pro\_users | A list of users for whom Burp Suite Pro should be licensed.  (Burp Suite Pro must be licensed separately for each user that requires it.) | `[root]` | No |

## Dependencies ##

None.

## Example Playbook ##

Here's how to use it in a playbook:

```yaml
- hosts: all
  become: true
  become_method: sudo
  tasks:
    - name: Install Burp Suite Professional
      ansible.builtin.include_role:
        name: burp_suite_pro
```

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.

## Author Information ##

Shane Frasier - <jeremy.frasier@gwe.cisa.dhs.gov>
