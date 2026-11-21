variable "dataset_name" {
  type        = string
  description = "Analytical dataset identifier"
  default     = "telemetry"

  validation {
    condition     = can(regex("^[a-z0-9_]{2,30}$", var.dataset_name))
    error_message = "dataset_name must be a lowercase alphanumeric identifier with underscores."
  }
}

variable "environment" {
  type        = string
  description = "Target deployment environment"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be dev, staging, or prod."
  }
}

variable "tags" {
  type        = map(string)
  description = "Resource governance tags"
  default = {
    Environment = "dev"
    ManagedBy   = "infraflow"
    Workload    = "data-platform"
  }
}
