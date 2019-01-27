#!/bin/bash

aws cloudformation $ACTION \
    --region us-east-2 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=972063557539.dkr.ecr.us-east-2.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-2ba0a343 \
    ParameterKey=Cluster,ParameterValue=default \
    ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:us-east-2:972063557539:listener/app/production-website/90d9748b14149549/2c45bf10ce6302f0
