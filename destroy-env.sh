#!/bin/bash

aws autoscaling detach-load-balancers --auto-scaling-group-name itmo-544-auto --load-balancer-names itmo-544-lb

aws autoscaling update-auto-scaling-group --auto-scaling-group-name itmo-544-auto --min-size 0 --desired-capacity 0

aws autoscaling delete-auto-scaling-group --auto-scaling-group-name itmo-544-auto --force-delete

aws autoscaling delete-launch-configuration --launch-configuration-name itmo-544-launchconfig

#!aws elb deregister-instances-from-load-balancer --load-balancer-name itmo-544-lb --instances $ID2

aws elb delete-load-balancer-listeners --load-balancer-name itmo-544-lb --load-balancer-ports 80

aws elb delete-load-balancer --load-balancer-name itmo-544-lb

#!aws ec2 terminate-instances --instance-ids $ID
