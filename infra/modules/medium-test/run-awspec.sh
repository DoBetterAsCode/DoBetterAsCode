#!/usr/bin/env bash

cd ${TERRAFORM_DIR} || exit

terraform init
kitchen converge $1
kitchen verify $1
kitchen destroy $1
