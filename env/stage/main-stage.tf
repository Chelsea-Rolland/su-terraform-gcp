module "tfResources" {
    source = "../../main"
    app_environment = "stage"
    project_id = ""
    bucket_name = ""
    vpc_network_name = "tf-demo-stage"
    vm_instance_name = "tf-demo-stage"
    vm_instance_machine_type = "f1-micro"
    vm_count = 4
    deleteObjAge = 9
    changeObjStateAge = 6
}