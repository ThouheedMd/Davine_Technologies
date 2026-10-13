output "server_name" {
  value = docker_container.server.name
}

output "ssh_command" {
  description = "Test SSH access to the server"
  value       = "ssh -i ../ansible/.ssh/id_ed25519 -p ${var.ssh_port} ansible@127.0.0.1"
}

output "website_url" {
  description = "Open this after running the Ansible playbook"
  value       = "http://localhost:${var.http_port}"
}

output "ansible_command" {
  value = "cd ../ansible && ansible-playbook playbook.yml"
}
