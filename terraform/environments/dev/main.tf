terraform {
  required_version = ">= 1.0.0"
  
  backend "gcs" {
    bucket = "your-terraform-state-bucket"
    prefix = "dev"
  }
}

locals {
  environment = "dev"
  project_id  = var.project_id
  region      = var.region
}

module "storage" {
  source = "../../modules/storage"
  
  project_id  = local.project_id
  environment = local.environment
}

module "document_ai" {
  source = "../../modules/document-ai"
  
  project_id  = local.project_id
  region      = local.region
  environment = local.environment
}

module "opensearch" {
  source = "../../modules/opensearch"
  
  project_id  = local.project_id
  region      = local.region
  environment = local.environment
}

module "cloud_run" {
  source = "../../modules/cloud-run"
  
  project_id  = local.project_id
  region      = local.region
  environment = local.environment
}

module "monitoring" {
  source = "../../modules/monitoring"
  
  project_id  = local.project_id
  environment = local.environment
}
