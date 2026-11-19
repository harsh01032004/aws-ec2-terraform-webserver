# Project 1: Deploy a Linux EC2 Web Server using Terraform

## Goal
Create a web server on AWS using Infrastructure as Code.

## What it builds
- VPC (10.0.0.0/16) and a public subnet (10.0.1.0/24)
- Internet gateway and route table
- Security group allowing HTTP (80) and SSH (22)
- Ubuntu 24.04 EC2 instance (t2.micro)
- Bash script (user_data) that installs Apache and serves a web page

## Files
- provider.tf: AWS provider and region (ap-south-1)
- network.tf: VPC, subnet, internet gateway, route table
- security.tf: security group
- ec2.tf: EC2 instance, Bash install script, public IP output

## How to run
terraform init
terraform validate
terraform plan
terraform apply

## Result
The web page "Capstone Project 1 - Harsh" loads at the instance's public IP.
Screenshot: webpage.png

## Cleanup
terraform destroy
