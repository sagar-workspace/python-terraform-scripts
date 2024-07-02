#!/bin/bash

export PATH=$PATH:/usr/local/bin:/usr/bin

amitag="server_backup"
project_name="monthly_backup"
region="ap-south-1"


if [ -z ${project_name} ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

echo "---- Region: ${region} ---"
ami_id=$(aws ec2 describe-images --owner self --region ${region} --filters "Name=tag:project, Values=${project_name}" --query "Images[].ImageId" --output text)

    if [ ! -z "${ami_id}" ]; then
        for ami in ${ami_id[@]}; do

            echo "Deregistering AMI: ${ami}"
            aws ec2 deregister-image --image-id "${ami}" --region ${region}
        done
    else
        echo "No AMI found"
    fi

echo "deregistration completed, started creating ami"
echo 'date'

if [ -z ${amitag} ]; then
	echo "Usage: $0 <amitag>"
	exit 1
fi

echo "Region is ${region}"
instance_id=$(aws ec2 describe-instances --region ${region} --filters "Name=tag:amitag, Values=${amitag}" --query Reservations[].Instances[].[InstanceId] --output text)
echo "instance_id is ${instance_id}"

	if [ ! -z "${instance_id}" ]; then
		for instance_id in ${instance_id[@]}; do
			echo "creating ami for instances: ${instance_id}"
			aws ec2 create-image --instance-id "${instance_id}" --name "image "${instance_id}"" --tag-specifications 'ResourceType=image,Tags=[{Key=project,Value=monthly_backup}]'

		done
	else
		echo "No instances found"
	fi
echo 'date'
