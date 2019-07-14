# DoBetterAsCode

[![CircleCI](https://circleci.com/gh/DoBetterAsCode/DoBetterAsCode.svg?style=svg)](https://circleci.com/gh/DoBetterAsCode/DoBetterAsCode)


A self-documenting repository/website demonstrating tools and practices for developing higher-quality "as code" with a fast feedback cycle.

See it live at [DoBetterAsCode.com](https://dobetterascode.com).

## Set up

Ensure you have Docker installed and running. You will also need a Java installation to use the [batect](https://batect.charleskorn.com/) task runner.

To configure the pre-commit hooks, install the [therapist](https://github.com/rehandalal/therapist) python module and run `therapist install` in the cloned repository.

## Folder structure

The "infra" folder is divided into "modules" of Terraform code, and the "project" which ties the modules together to create our static site hosted on AWS S3 with CloudFront.

The "app" folder contains a [Hugo](https://gohugo.io/) site which is compiled to HTML/CSS and pushed to S3.

The ".batect" folder contains Docker container defintions used for running tasks.

The ".circleci" folder contains our pipeline as code.

## Test

### Validation
The following local validation tasks may be run from batect:

`terraform-tflint` - runs [tflint](https://github.com/wata727/tflint) to ensure our Terraform modules have valid syntax and match the AWS validation rules provided by AWS SDK

`pipeline-validate` - runs [circleci-cli](https://circleci.com/docs/2.0/local-cli/) to make sure our CircleCI pipeline as code is valid

`yaml-lint` - runs [yamllint](https://github.com/adrienverge/yamllint) to ensure all our yaml files are well formed

`shell-lint` - runs [shellcheck](https://github.com/koalaman/shellcheck) to check the syntax of our bash scripts and warn of possible bugs

### Unit

`terraform-local-apply` - runs a terraform apply against an AWS mock powered by [localstack](https://github.com/localstack/localstack)  
  _localstack limitations mean we are only able to test our S3 module at this point in time_

### Integration

Tests for our infrastructure modules are located in `infra/integration-test`.
These tests use [kitchen-terraform](https://github.com/test-kitchen/test-kitchen) and [awspec](https://www.inspec.io/) to create resources in AWS and then verify that the resources exist and meet our requirements.

The `terraform-integration-test` task runs the full suite of tests.  
You can specify an individual test to run by providing the name to batect (e.g. `./batect terraform-integration-test -- certificate`)

## Hooks

The pre-commit hooks powered by Therapist will run all relevant validation tasks based on the files you are changing/committing.
