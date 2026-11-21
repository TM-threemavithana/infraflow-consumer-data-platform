output "lakehouse_bucket_name" {
  description = "Identifier of the simulated Lakehouse bucket"
  value       = terraform_data.lakehouse_storage.output.bucket_name
}

output "analytical_dataset_id" {
  description = "Identifier of the simulated analytical dataset"
  value       = terraform_data.analytical_dataset.output.dataset_id
}
