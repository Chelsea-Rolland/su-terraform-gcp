module "base-mod" {
  source = "../modules/base-mod"
  app_environment = "stage"
  gcp_project_id = "<GCP-PROJECT-ID-HERE>"
  bucket_name = "<GCP-PROJECT-ID-HERE>"
  vpc_network_name = "tf-demo"
  vm_instance_name = "tf-demo"
  vm_instance_machine_type = "f1-micro"
  vm_count = 2
  deleteObjAge = 240
  changeObjStateAge = 10
}