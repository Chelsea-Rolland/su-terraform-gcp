# Google Cloud Infrastructure Management with Terraform Tutorial

Intro into Terraform with GCP in [aCloudGuru GCP Sandbox](https://learn.acloud.guru/cloud-playground/cloud-sandboxes)

## Instructions

### Setting up Remote-Backend with Simple Bucket Creation

1). Open Cloud Shell terminal then click CONTINUE

2). Input command below to list authorized accounts in terminal. Click AUTHORIZE. This will authorize Cloud Shell.
```bash
gcloud auth list
```
3). Input command below to list the project id. Then copy the value after project = <VALUE> this is your project id
```bash
gcloud config list project
```

4). Open the EDITOR from the terminal in GCP. Then at the top of the screen, click TERMINAL --> New Terminal

5). Setting the default project id for gcloud in Cloud Shell. Paste the <VALUE> in <PROJECT_ID>
```bash
gcloud config set project <PROJECT_ID>
```

6). Create a modules folder and a remote-backend subfolder
```bash
mkdir modules
cd modules
mkdir remote-backend
cd remote-backend
```
7). Create a main.tf, variables.tf, and terraform.tfvars files inside of the folder. Make sure to fill in <GCP_PROJECT_ID> with your project ID from above step in `terraform.tfvars`
```bash
touch main.tf providers.tf variables.tf terraform.tfvars
```
8). Copy the code from inside of [here](https://github.com/Chelsea-Rolland/su-terraform-gcp/tree/main/modules/remote-backend) into these files

9). Next Steps will be the terraform commands to initialize and generate the infrastructure inside of GCP

9a). Terraform init: Prepares your working directory for other TF commands and downloads provider & modules
```bash
terraform init
```

9b). Terraform validate: Checks whether the config is valid
```bash
terraform validate
```

9c). Terraform plan: Review the changes TF will make to your infrastructure; creates state file
```bash
terraform plan
# Flags(Optional): -var-file: will pull the values from tfvars file & -out: will take tf plan and make it into a file
terraform plan -var-file="<VAR-FILE-NAME>.tfvars" -out="<PLAN-FILE-NAME>.tfplan"
```

9d). Terraform apply: TF provisions your infrastructure and updates the state file
```bash
terraform apply
# with plan file (Optional)
terraform apply "<PLAN-FILE-NAME>.tfplan"
```

9e). After Terraform completed building infrastructure, check the GCP Console to see the newly built infrastructure

10). When ready to delete the infrastructure, run Terraform destroy: Destroys previously created infrastructure; state file is required
```bash
terraform destroy
# with .tfvars file (Optional)
terraform destroy -var-file="<VAR-FILE-NAME>.tfvars"
```

Bonus). Now that you have worked through each terraform command, you can automate it by using it in a script. Create the script `remote-backend.sh` and copy the code from [here](https://github.com/Chelsea-Rolland/su-terraform-gcp/blob/main/remote-backend.sh). Try rebuilding the same infrastructure from the root folder by running the `remote-backend.sh` script
```bash
~ cd
touch remote-backend.sh
```
```bash
chmod +x remote-backend.sh
./remote-backend.sh
```

* * * * *

### Different Environments with Workspaces
Another benefit of Terraform is that you're able to use similar configurations for different environments. One way to do this is with workspaces. Workspaces are independently managed state files. We will work with a script that will build our workspace for us based on our env. 



11). Create a base-mod folder inside of modules folder and copy code and files into it from [here](https://github.com/Chelsea-Rolland/su-terraform-gcp/tree/main/modules/base-mod). We're creating a base module since each of our env has a similar infrastructure 
```bash
cd ~/modules
mkdir base-mod
touch main.tf providers.tf variables.tf
```

12). Create a folder for each env
```bash
cd ~
mkdir dev stage prod
```

13). Inside of each env folder it should have its own main-<ENV>.tf and backend-<ENV>.tf. Copy the code from [here](). Make sure to input your data inside anything with <>. 

ex.) Take the bucket name from the bucket we created in an earlier step and input it inside of the bucket property in `backend-<ENV>.tf`. Each workspace's state file will be in the same location.
```bash
cd ~/dev
touch main-dev.tf backend-dev.tf
```

14). Return to the root directory then create the script `run.sh` and copy the code from [here](https://github.com/Chelsea-Rolland/su-terraform-gcp/blob/main/run.sh). 
```bash
cd ~
touch run.sh
```
15). Run the following command to return to the root directory, initialize the backend 1st then create a workspace based on the env.
```bash
chmod +x run.sh
./run.sh dev init
```
16). Run the following command to complete the TERRAFORM PLAN
```bash
cd ~
./run.sh dev plan
```
17). Run the following command to complete the TERRAFORM APPLY
```bash
cd ~
./run.sh dev apply
```
18). Run the following command to complete the TERRAFORM DESTROY
```bash
cd ~
./run.sh dev destroy
```
Bonus). All Together Now for next env
```bash
cd ~
chmod +x run.sh
./run.sh <ENV> init
./run.sh <ENV> plan
./run.sh <ENV> apply
```
### Thank you for attending my presentation about GCP Infrastructure Management with Terraform :computer: :keyboard: :smile:
