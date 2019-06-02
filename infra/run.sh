#!/usr/bin/env bash

echo "Running for project ${TERRAFORM_DIR}"
cd ${TERRAFORM_DIR} || exit

echo "Initialising Terraform"
terraform init

echo "Running Terraform operation ${TF_OPERATION}"
terraform ${TF_OPERATION} -auto-approve