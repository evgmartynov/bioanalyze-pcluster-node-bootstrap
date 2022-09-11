#!/usr/bin/env bash

aws s3 \
  --no-sign-request \
  --region eu-west-1 \
  sync s3://ngi-igenomes/igenomes/ \
  /scratch/reference/igenomes/
