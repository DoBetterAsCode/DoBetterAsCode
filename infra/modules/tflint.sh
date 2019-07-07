#!/usr/bin/env bash

cd ${TERRAFORM_DIR} || exit

find . -type d -maxdepth 1 | while read module; do
   echo $module
   tflint $module
done