#!/usr/bin/env bash

cd ${TERRAFORM_DIR} || exit

terraform init

tflint