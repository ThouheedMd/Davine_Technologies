output "file_paths" {
  value = [for f in local_file.config : f.filename]
}
