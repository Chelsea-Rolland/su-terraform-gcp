module "tfResources" {
    source = "../../main"
    app_environment = "dev"
    project_id = ""
    bucket_name = ""
    vpc_network_name = "tf-demo-dev"
    vm_instance_name = "tf-demo-dev"
    vm_instance_machine_type = "f1-micro"
    vm_count = 2
    deleteObjAge = 5
    changeObjStateAge = 3
}