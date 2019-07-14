#!/usr/bin/env bash

cd "${TERRAFORM_DIR}" || exit

terraform init
kitchen converge "$1"
kitchen verify "$1"
[[ -z "$1" ]] && sleep 1200 # Sleep if running all suites to give CloudFront time to deploy so it can be destroyed
kitchen destroy "$1"
