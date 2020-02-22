#!/bin/bash
instance1ID=`aws ec2 describe-instances --filters 'Name=tag:Name,Values=MyInstance1' --output text --query 'Reservations[*].Instances[*].InstanceId'`
echo "$instance1ID"
