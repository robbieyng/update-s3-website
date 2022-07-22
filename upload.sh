#!/bin/bash

src="${PWD}/build"
dest_bucket="s3://"
cf_dist=""

aws s3 sync $src $dest_bucket

# option to create CloudFront invalidation
if [[ $1 = "cc" ]]
then
  echo "Invalidating CloudFront cache..."
  aws cloudfront create-invalidation --distribution-id $cf_dist --paths "/*"
fi