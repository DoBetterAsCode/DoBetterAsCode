#!/usr/bin/env bash

set -euxo pipefail

cd ${TERRAFORM_DIR} || exit

echo "Applying Terraform project against Localstack"
/code/infra/run.sh

echo "Removing state"
rm terraform.tfstate