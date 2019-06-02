#!/usr/bin/env bash

cd ${TERRAFORM_DIR} || exit

kitchen converge $1
kitchen verify $1
kitchen destroy $1
