#!/usr/bin/env bash

cd "${TERRAFORM_DIR}" || exit

# Initialise project
terraform init
# Create testing infra
kitchen converge "$1"
# Run integration tests against testing infra
kitchen verify "$1"

#[[ -z "$1" ]] && sleep 1200 # Sleep if running all suites to give CloudFront time to deploy so it can be destroyed
#kitchen destroy "$1"
