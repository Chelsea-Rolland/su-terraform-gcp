#!/usr/bin/env bash

TF_ENV=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "$DIR"

# Always run from the location of this script
cd $DIR

if [ $# -gt 0 ]; then
    if [ "$2" == "init"]; then
        terraform -chdir=./$TF_ENV init
        terraform -chdir=./$TF_ENV workspace list
        ENV_WRKSP=$(terraform -chdir=./$TF_ENV workspace show)
        echo "Current Workspace ENV is [ $ENV_WRKSP ]"
        if [ $TF_ENV eq $ENV_WRKSP]; then
            terraform -chdir=./$TF_ENV workspace select $TF_ENV
        else 
            terraform -chdir=./$TF_ENV workspace new $TF_ENV
            terraform -chdir=./$TF_ENV workspace select $TF_ENV
            echo "New/Current Workspace ENV is [ $ENV_WRKSP ]"
        fi
    else if [ "$2" == "plan"]; then
        terraform -chdir=./$TF_ENV $2 -out="tf-$TF_ENV.tfplan"
    else if [ "$2" == "apply"]; then
        terraform -chdir=./$TF_ENV $2 "tf-$TF_ENV.tfplan"
    else
        terraform -chdir=./$TF_ENV $2
    fi
fi

# Head back to original location to avoid surprises
cd -