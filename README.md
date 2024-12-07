# AWS CKAD Study Lab

A simple AWS environment to support learning and certification
objectives for the Linux Foundation Certified Kubernetes Application
Developer exam.

Environment created:
- AWS VPC with private subnets for up to 4 AZs in the region
- Single NAT gateway to front all AZs in the region
- Default ingress network ACLs is deny all
- Default egress network ACLs is permit any

Limitations:
- Public subnets are required even when all I want is private subnets and a NAT gateway, but the VPC module requires it.

Caveat:
- I do not recall if the EKS Terraform is functional (hence the .block)
- the cluster.yaml is for eksctl and the mechanisms for identity based access has changed and likely no longer works.

