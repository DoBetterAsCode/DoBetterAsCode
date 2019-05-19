#!/usr/bin/env bash

cd ${TERRAFORM_DIR} || exit

kitchen converge
kitchen verify
kitchen destroy

# echo "Running Terraform tests"

# echo "Applying Terraform project"
# /code/infra/run.sh
# terraform output -json > outputs.json

# echo "Running tests"


# echo "Removing state"
# rm terraform.tfstate
# rm terraform.tfstate.backup