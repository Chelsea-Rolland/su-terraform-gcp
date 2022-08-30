#!/usr/bin/env bash

cd modules/remote-backend

terraform fmt

# Backend will be local since its a simple bucket creation
terraform init

# Makes sure our basic configs are correct. This will not catch everything, but its a good practice to implement for basic config
terraform validate

terraform plan -var-file="terraform.tfvars" -out="remote-backend.tfplan"

terraform apply "remote-backend.tfplan"

# Informing us it has been completed
echo "COMPLETED CREATING REMOTE BACKEND BUCKET"

# Returning to home directory
cd ~

echo "BACK IN HOME DIRECTORY"

pwd