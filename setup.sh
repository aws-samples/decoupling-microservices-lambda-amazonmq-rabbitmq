#!/bin/bash
set -eo pipefail
BUCKET_ID=$(dd if=/dev/random bs=8 count=1 2>/dev/null | od -An -tx1 | tr -d ' \t\n')
BUCKET_NAME=lambda-artifacts-$BUCKET_ID
echo $BUCKET_NAME > bucket-name.txt
aws s3 mb s3://$BUCKET_NAME

pip3 install pika -t python/
zip -r9 layer.zip python -q
aws s3 cp layer.zip s3://$BUCKET_NAME
aws lambda publish-layer-version \
    --layer-name pika \
    --content S3Bucket=$BUCKET_NAME,S3Key=layer.zip \
    --compatible-runtimes python3.9

layerArn=$(aws lambda list-layer-versions --layer-name pika --query 'LayerVersions[0].LayerVersionArn' | tr -d '"')

aws cloudformation deploy --template-file ./Template/MQTemplate.yaml --stack-name microservices-AmazonMQ --parameter-overrides PikaLayerARN=$layerArn --capabilities CAPABILITY_NAMED_IAM

