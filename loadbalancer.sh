#!/bin/bash
echo "list all availability zones to Create Load balancer"
aws ec2 describe-availability-zones

read -p "Please mention the subnet = " zone1
read -p "Please mention the subnet = " zone2
read -p "Please mention the subnet = " zone3

echo "Setting up Load-balancer"
read -p "Please mention the Loadbalancername = " loadbalancer 

aws elb create-load-balancer --load-balancer-name $loadbalancer --listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80" --subnets $subnetid
aws elb register-instances-with-load-balancer --load-balancer-name $loadbalancer --instances i-06a19504d1a955760 i-0b73a4c151cf3f0e9
aws elb configure-health-check --load-balancer-name $loadbalancer --health-check Target=HTTP:80/index.php,Interval=10,UnhealthyThreshold=2,HealthyThreshold=2,Timeout=3




#aws elb create-load-balancer --load-balancer-name $loadbalancer --listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80" --subnets $subnetid1 $subnetid2 --availability-zones $zone $zone2 $zone3
#aws elb configure-health-check --load-balancer-name $loadbalancer --health-check Target=HTTP:80/png,Interval=15,UnhealthyThreshold=2,HealthyThreshold=2,Timeout=3
