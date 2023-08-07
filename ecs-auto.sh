#!/bin/bash
SERVICE="demo-svc"
CLUSTER_NAME="demo-cluster"
AWS_REGION="ap-south-1"
export AWS_PROFILE=default

# Register a new Task definition 
aws ecs register-task-definition --family harinath --cli-input-json file://task-new.json --region $AWS_REGION

# Update Service in the Cluster
aws ecs update-service --cluster $CLUSTER_NAME --service $SERVICE --task-definition harinath --desired-count 1 --region $AWS_REGION

