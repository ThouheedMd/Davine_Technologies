output "welcome_file" {
  description = "Path of the welcome file"
  value       = local_file.welcome.filename
}

output "config_files" {
  description = "Config files created by the module"
  value       = module.app_configs.file_paths
}

output "environment" {
  value = var.environment
}
