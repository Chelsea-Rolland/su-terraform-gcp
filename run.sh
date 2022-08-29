#!/usr/bin/env bash

TF_ENV=$1

echo "Inputted Environment = [ $TF_ENV ]"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "DIR = $DIR"

# Always run from the location of this script
cd $DIR

if [ $# -gt 0 ]; then
    if [ "$2" == "init" ]; then
        terraform -chdir=./$TF_ENV init
        terraform -chdir=./$TF_ENV workspace list
        ENV_WRKSP=$(terraform -chdir=./$TF_ENV workspace show)
        echo "Current Workspace ENV is [ $ENV_WRKSP ]"
        if [ $TF_ENV == $ENV_WRKSP ]; then
            terraform -chdir=./$TF_ENV workspace select $TF_ENV
            CHG_WKSP=$(terraform -chdir=./$TF_ENV workspace show)
            echo "Workspace has been changed to [ $CHG_WKSP ]"
        else 
            terraform -chdir=./$TF_ENV workspace new $TF_ENV
            terraform -chdir=./$TF_ENV workspace select $TF_ENV
            NEW_WKSP=$(terraform -chdir=./$TF_ENV workspace show)
            echo "New/Current Workspace ENV is [ $NEW_WKSP ]"
        fi
    echo "COMPLETED TERRAFORM TASK - [ $2 ]"
    elif [ "$2" == "plan" ]; then
        terraform -chdir=./$TF_ENV workspace select $TF_ENV
        ENV_WRKSP1=$(terraform -chdir=./$TF_ENV workspace show)
        echo "Current Workspace ENV is [ $ENV_WRKSP1 ]"
        terraform -chdir=./$TF_ENV $2 -out="tf-$TF_ENV.tfplan"
        echo "COMPLETED TERRAFORM TASK - [ $2 ]"
    elif [ "$2" == "apply" ]; then
        terraform -chdir=./$TF_ENV workspace select $TF_ENV
        ENV_WRKSP2=$(terraform -chdir=./$TF_ENV workspace show)
        echo "Current Workspace ENV is [ $ENV_WRKSP2 ]"
        terraform -chdir=./$TF_ENV $2 "tf-$TF_ENV.tfplan"
        echo "COMPLETED TERRAFORM TASK - [ $2 ]"
    else
        terraform -chdir=./$TF_ENV workspace select $TF_ENV
        ENV_WRKSP3=$(terraform -chdir=./$TF_ENV workspace show)
        echo "Current Workspace ENV is [ $ENV_WRKSP3 ]"
        terraform -chdir=./$TF_ENV $2
        echo "COMPLETED TERRAFORM TASK - [ $2 ]"
    fi
fi

# Head back to original location to avoid surprises
cd -