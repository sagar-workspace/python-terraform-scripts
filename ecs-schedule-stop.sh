#!/bin/bash

export PATH=$PATH:/usr/local/bin:/usr/bin

ecsClusterName="dev-api-cluster"

echo `date`

aws ecs list-services --cluster ${ecsClusterName}

echo "stoping dev-api-cluster services"

aws ecs list-services --cluster ${ecsClusterName} | awk -F'"' '{print $2}' | rev | awk -F'/' '{print $1}' | rev | grep -v serviceArns > services.txt

for service in $(cat services.txt); do aws ecs update-service --cluster ${ecsClusterName} --service "$service" --desired-count 0 --no-cli-pager > /dev/null; done
echo `date`