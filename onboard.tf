data "template_file" "cloud-init" {
  count    = length(var.azs)
  template = file("${path.module}/cloudinit.txt")
  vars = {
    DO_URL     = var.DO_URL
    AS3_URL    = var.AS3_URL
    TS_URL     = var.TS_URL
    CF_URL     = var.CF_URL
    licensekey = var.licensekey[count.index]
    ext_selfip = var.ext_selfip[count.index]
    int_selfip = var.int_selfip[count.index]
    default_gateway_ip = var.default_gateway_ip[count.index]
    hostname   = var.hostname[count.index]
    remoteHost  = var.mgmt_private_ip[1]
    remoteHostName = var.hostname[1]
    haDirection = var.haDirection[count.index]
    members     = var.device-group-members
    uname      = var.uname
    upassword  = var.upassword
  }
}
