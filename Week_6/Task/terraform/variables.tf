variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "devops-week6"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be dev, staging or prod."
  }
}

variable "owner" {
  description = "Owner of the infrastructure"
  type        = string
  default     = "devops-intern"
}

variable "app_names" {
  description = "Applications that need a config file"
  type        = list(string)
  default     = ["frontend", "backend"]
}
