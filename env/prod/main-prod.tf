module "tfResources" {
    source = "../../main"
    app_environment = "prod"
    project_id = ""
    bucket_name = ""
    vpc_network_name = "tf-demo-prod"
    vm_instance_name = "tf-demo-prod"
    vm_instance_machine_type = "f1-micro"
    vm_count = 5
    deleteObjAge = 10
    changeObjStateAge = 5
}