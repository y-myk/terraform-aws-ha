
resource "local_file" "cloud-init_file" {
  count = length(var.azs)

  content  = data.template_file.cloud-init[count.index].rendered
  filename = "${path.module}/${var.cloud-init_file[count.index]}"
}