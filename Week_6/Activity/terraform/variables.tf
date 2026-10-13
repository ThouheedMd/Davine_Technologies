variable "docker_host" {
  description = "Docker daemon address (use npipe:////.//pipe//docker_engine on Windows without WSL)"
  type        = string
  default     = "unix:///var/run/docker.sock"
}

variable "server_name" {
  description = "Name of the server container and image"
  type        = string
  default     = "week6-server"
}

variable "ssh_port" {
  description = "Host port mapped to SSH (22) in the server"
  type        = number
  default     = 2222
}

variable "http_port" {
  description = "Host port mapped to HTTP (80) in the server"
  type        = number
  default     = 8081
}
