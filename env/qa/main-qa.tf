module "tfResources" {
    source = "../../main"
    app_environment = "qa"
    project_id = ""
    bucket_name = ""
    vpc_network_name = "tf-demo-qa"
    vm_instance_name = "tf-demo-qa"
    vm_instance_machine_type = "f1-micro"
    vm_count = 3
    deleteObjAge = 7
    changeObjStateAge = 4
}