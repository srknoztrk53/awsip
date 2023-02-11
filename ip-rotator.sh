#!/usr/bin/env bash
#Delete Location All Elastic IP Address
ALLOCATION_ID=$(aws ec2 describe-addresses | grep -i AllocationId | cut -f 2 -d ":" | sed 's/"//g' | tr -d "," | head -n 10)
echo $(aws ec2 release-address  --allocation-id $ALLOCATION_ID)

#New IP Address
INSTANCE="i-XXXXXXXXXX"
NEW_IP=$(aws ec2 allocate-address --query PublicIp | tr -d '"')
aws ec2 associate-address --instance-id $INSTANCE --public-ip $NEW_IP
