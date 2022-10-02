#!/bin/bash

aws lambda delete-layer-version --layer-name pika --version-number 1
BUCKET=$(cat bucket-name.txt)
aws s3 rb --force s3://$BUCKET
rm bucket-name.txt
aws cloudformation delete-stack --stack-name microservices-AmazonMQ
