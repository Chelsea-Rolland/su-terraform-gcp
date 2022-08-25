#!/usr/bin/env bash
 
TF_ENV=$1
 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "$DIR"
# Always run from the location of this script
cd $DIR
 
if [ $# -gt 0 ]; then
    if [ "$2" == "init" ]; then
        #terraform -chdir=./$TF_ENV init -backend-config=env/$TF_ENV/backend-$TF_ENV.tf
        terraform init
    else if ["$2 == "plan" ]; then
        terraform plan --var-file="$TF_ENV/$TF_ENV.tfvars" -out="$TF_ENV-tf-plan.tfplan"
    else
        terraform $2 "$TF_ENV-tf-plan"
    fi
fi
 
# Head back to original location to avoid surprises
cd -