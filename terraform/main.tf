# Data Platform Reference Module — Cloud-Free Simulation
# Models Lakehouse Storage Bucket and BigQuery Analytical Dataset using terraform_data.

terraform {
  required_version = ">= 1.6.0"
}

resource "terraform_data" "lakehouse_storage" {
  input = {
    bucket_name        = "lakehouse-${var.dataset_name}-${var.environment}"
    ubla_enabled       = true
    versioning_enabled = true
    location           = "US"
    cmek_key_id        = "projects/p/locations/global/keyRings/r/cryptoKeys/k"
    tags               = var.tags
  }
}

resource "terraform_data" "analytical_dataset" {
  input = {
    dataset_id  = "analytics_${var.dataset_name}_${var.environment}"
    location    = "US"
    environment = var.environment
  }
}
