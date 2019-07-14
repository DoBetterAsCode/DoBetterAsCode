#!/usr/bin/env sh

echo "Syncing to s3 bucket: dobetterascode-${ENVIRONMENT}"
aws s3 sync public/ "s3://dobetterascode-${ENVIRONMENT}" --delete