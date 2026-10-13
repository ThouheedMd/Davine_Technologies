terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "local_file" "config" {
  for_each = toset(var.app_names)

  filename = "${var.output_dir}/${each.key}.conf"
  content  = "app=${each.key}\nenvironment=${var.environment}\n"
}
