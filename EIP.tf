
resource "aws_eip" "mgmt-eip" {
  count                     = length(local.vpc_mgmt_subnet_ids)
  vpc                       = true
  network_interface         = aws_network_interface.bigip-mgmt[count.index].id
  associate_with_private_ip = var.mgmt_private_ip[count.index]

    tags = {
    Name = format("%s-mgmt-eip-%s-%s", var.prefix, count.index, random_id.id.hex)
  }
}

resource "aws_eip" "ext-eip" {
  count                     = length(local.vpc_public_subnet_ids)
  vpc                       = true
  network_interface         = aws_network_interface.bigip-ext[count.index].id
  associate_with_private_ip = var.ext_selfip[count.index]

    tags = {
    Name = format("%s-ext-eip-%s-%s", var.prefix, count.index, random_id.id.hex)
  }
}

resource "aws_eip" "app1-vip" {
  vpc                       = true
  network_interface         = aws_network_interface.bigip-ext[0].id
  associate_with_private_ip = var.app1_vip[0]

    tags = {
    Name = format("%s-app1-eip-%s", var.prefix, random_id.id.hex)
    f5_cloud_failover_label = "mydeployment"
    f5_cloud_failover_vips = var.f5_cloud_failover_vips_app1
    }
}