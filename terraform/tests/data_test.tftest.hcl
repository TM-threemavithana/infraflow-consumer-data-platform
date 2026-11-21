# Data Platform Native Test Suite

run "verify_data_defaults" {
  command = plan

  assert {
    condition     = var.dataset_name == "telemetry"
    error_message = "Default dataset_name must be 'telemetry'."
  }

  assert {
    condition     = var.environment == "dev"
    error_message = "Default environment must be 'dev'."
  }
}

run "verify_custom_data_lake" {
  command = plan

  variables {
    dataset_name = "customer_events"
    environment  = "prod"
    tags = {
      Environment = "prod"
      ManagedBy   = "infraflow"
      Workload    = "data-platform"
    }
  }

  assert {
    condition     = var.dataset_name == "customer_events"
    error_message = "Dataset name mismatch in custom configuration."
  }

  assert {
    condition     = var.environment == "prod"
    error_message = "Production environment mismatch."
  }
}
