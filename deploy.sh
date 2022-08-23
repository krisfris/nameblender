#!/bin/bash

source .env

npm install
npm run build

# Upload static part to S3
aws s3 sync --delete dist/ $S3_URL

# Invalidate CloudFront cache
aws cloudfront create-invalidation \
    --distribution-id $CLOUDFRONT_DISTRO_ID \
    --paths "/index.html"
