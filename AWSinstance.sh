#!/bin/bash
aws ec2 run-instances \
  --image-id ami-01bc990364452ab3e \
  --count 1 \
  --instance-type t2.micro \
  --key-name mykeylabak \
  --security-group-ids sg-0675a190bdc57ffe0 \
  --subnet-id subnet-0ff5acba047b6e671 \
  --iam-instance-profile Name=adminEC2Profile \
  --user-data file://scripttwo.sh