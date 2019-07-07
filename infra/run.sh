#!/usr/bin/env bash

echo "Running for project ${TERRAFORM_DIR}"
cd ${TERRAFORM_DIR} || exit

echo "Creating .terraformrc in ${HOME}"
echo "credentials \"app.terraform.io\" { token = \"${TF_TOKEN}\" }" > ~/.terraformrc

echo "Initialising Terraform"
terraform init -input=false || true

echo "Changing to Terraform workspace"
terraform workspace select ${TF_VAR_env} || terraform workspace new ${TF_VAR_env}

echo "Running Terraform operation ${TF_OPERATION}"
terraform ${TF_OPERATION} -auto-approve