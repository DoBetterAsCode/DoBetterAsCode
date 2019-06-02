#!/usr/bin/env sh

echo "Syncing to s3 bucket: dobetterascode-${ENVIRONMENT}"
aws s3 sync src/ s3://dobetterascode-${ENVIRONMENT} --delete