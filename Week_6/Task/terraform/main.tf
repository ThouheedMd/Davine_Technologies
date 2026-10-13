# Weekly task: basic Terraform configuration using the "local" provider.
# No cloud account is needed - Terraform creates files on your machine.

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

# Provider configuration (the local provider needs no settings)
provider "local" {}

# Resource: a text file built from variables
resource "local_file" "welcome" {
  filename = "${path.module}/output/${var.project_name}-welcome.txt"
  content  = "Welcome to ${var.project_name}!\nEnvironment: ${var.environment}\nOwner: ${var.owner}\n"
}

# Module: generates one config file per name in the list
module "app_configs" {
  source      = "./modules/file_generator"
  environment = var.environment
  app_names   = var.app_names
  output_dir  = "${path.module}/output"
}
