module "remote-backend" {
  source = "../modules/remote-backend"
  app_environment = "prod"
  gcp_project_id = "<GCP-PROJECT-ID-HERE>"
}

module "base-mod" {
  source = "../modules/base-mod"
  app_environment = "prod"
  gcp_project_id = "<GCP-PROJECT-ID-HERE>"
  bucket_name = "<GCP-PROJECT-ID-HERE>"
  vpc_network_name = "tf-demo"
  vm_instance_name = "tf-demo"
  vm_instance_machine_type = "f1-micro"
  vm_count = 4
  deleteObjAge = 365
  changeObjStateAge = 14
}