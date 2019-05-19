#!/usr/bin/env bash

echo "Running for project ${TERRAFORM_DIR}"
cd ${TERRAFORM_DIR} || exit

echo "Initialising Terraform"
terraform init

echo "Applying Terraform"
terraform apply -auto-approve