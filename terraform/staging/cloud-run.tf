# ---------------------------------------------------------------------------------------------------------------------
# SETUP TERRAFORM CLOUD FOR STORING STATE
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = "= 0.14.2"
  backend "remote" {
    organization = "org"

    workspaces {
      name = "org-workspace-backend"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# SETUP PROVIDER
# ---------------------------------------------------------------------------------------------------------------------

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# ---------------------------------------------------------------------------------------------------------------------
# Module for create Cloud Run each service
# ---------------------------------------------------------------------------------------------------------------------

module cloud_run_svc_1 {
  
  source = "./service"

  project_id        = var.project_id
  project_name      = "org"
  location          = "asia-southeast1"
  gcr_region        = "asia"
  cloudrun_srv_name = "svc-1-org-stag"
  image_name        = "svc-1-org-stag"
  image_tag         = "latest"
  container_port    = 5000

}

module cloud_run_svc_2 {
  
  source = "./service"
  
  project_id        = var.project_id
  project_name      = "org"
  location          = "asia-southeast1"
  gcr_region        = "asia"
  cloudrun_srv_name = "svc-2-org-stag"
  image_name        = "svc-2-org-stag"
  image_tag         = "latest"
  container_port    = 8080

}

module cloud_run_svc_3 {
  
  source = "./service"
  
  project_id        = var.project_id
  project_name      = "org"
  location          = "asia-southeast1"
  gcr_region        = "asia"
  cloudrun_srv_name = "svc-3-org-stag"
  image_name        = "svc-3-org-stag"
  image_tag         = "latest"
  container_port    = 8081

}

module cloud_run_svc_4 {
  
  source = "./service"
  
  project_id        = var.project_id
  project_name      = "org"
  location          = "asia-southeast1"
  gcr_region        = "asia"
  cloudrun_srv_name = "svc-4-org-stag"
  image_name        = "svc-4-org-stag"
  image_tag         = "latest"
  container_port    = 8082

}

module cloud_run_svc_5 {
  
  source = "./service"
  
  project_id        = var.project_id
  project_name      = "org"
  location          = "asia-southeast1"
  gcr_region        = "asia"
  cloudrun_srv_name = "svc-5-org-stag"
  image_name        = "svc-5-org-stag"
  image_tag         = "latest"
  container_port    = 8083

}
