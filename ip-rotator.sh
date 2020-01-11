#!/usr/bin/env bash
#Delete Location All Elastic IP Address
ALLOCATION_ID=$(aws ec2 describe-addresses | grep -i AllocationId | cut -f 2 -d ":" | sed 's/"//g' | tr$
echo $(aws ec2 release-address  --allocation-id $ALLOCATION_ID)
ALLOCATION_ID=$(aws ec2 describe-addresses | grep -i AllocationId | cut -f 2 -d ":" | sed 's/"//g' | tr$
echo $(aws ec2 release-address  --allocation-id $ALLOCATION_ID)
ALLOCATION_ID=$(aws ec2 describe-addresses | grep -i AllocationId | cut -f 2 -d ":" | sed 's/"//g' | tr$
echo $(aws ec2 release-address  --allocation-id $ALLOCATION_ID)
ALLOCATION_ID=$(aws ec2 describe-addresses | grep -i AllocationId | cut -f 2 -d ":" | sed 's/"//g' | tr$
echo $(aws ec2 release-address  --allocation-id $ALLOCATION_ID)
ALLOCATION_ID=$(aws ec2 describe-addresses | grep -i AllocationId | cut -f 2 -d ":" | sed 's/"//g' | tr$
echo $(aws ec2 release-address  --allocation-id $ALLOCATION_ID)

#New IP Address
INSTANCE=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
NEW_IP=$(aws ec2 allocate-address --query PublicIp | tr -d '"')
aws ec2 associate-address --instance-id $INSTANCE --public-ip $NEW_IP
