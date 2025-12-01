#!/bin/bash
aws ec2 run-instances \
  --image-id ami-053b0d53c279acc90 \
  --count 1 \
  --instance-type t3.micro \
  --key-name mykeylabak2 \
  --security-group-ids sg-0b300b53d7385c546 \
  --subnet-id subnet-06b1b42e34afc9fa8 \
  --iam-instance-profile Name="adminEC2Role" \
  --user-data file://scriptthree.sh