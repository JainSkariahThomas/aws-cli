#!/bin/bash

echo "setting up ec2 instance with additional ebs and mounting"
aws ec2 run-instances --image-id ami-0217a85e28e625474 --key-name MyKeyPair5 --security-groups my-aws-class-one --instance-type t2.micro --placement AvailabilityZone=ap-south-1a --block-device-mappings DeviceName=/dev/sdb,Ebs={VolumeSize=1} --count 1 --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=clivolume}]' --user-data file:///home/adminz/JAINAWS/Docker/install.txt

echo "Provison finsihed"
