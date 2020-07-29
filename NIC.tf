resource "aws_network_interface" "bigip-mgmt" {
  count              = length(local.vpc_mgmt_subnet_ids)
  subnet_id          = (local.vpc_mgmt_subnet_ids)[count.index]
  source_dest_check  = "false"
  private_ips         = [(var.mgmt_private_ip)[count.index]]
  security_groups    = [aws_security_group.sg-Internet.id]

  tags = {
    Name = format("%s-bigip-mgmt-%s-%s", var.prefix, count.index, random_id.id.hex)
  }
}

resource "aws_network_interface" "bigip-ext" {
  count              = length(local.vpc_public_subnet_ids)
  subnet_id          = (local.vpc_public_subnet_ids)[count.index]
  source_dest_check  = "false"
  private_ips       = [(var.ext_selfip)[count.index], (var.app1_vip)[count.index]]
  security_groups    = [aws_security_group.sg-Internet.id]

  tags = {
    Name = format("%s-bigip-ext-%s-%s", var.prefix, count.index, random_id.id.hex)
    f5_cloud_failover_label = "mydeployment"
  }
}

resource "aws_network_interface" "bigip-int" {
  count              = length(local.vpc_private_subnet_ids)
  subnet_id          = (local.vpc_private_subnet_ids)[count.index]
  source_dest_check  = "false"
  private_ips        = [(var.int_selfip)[count.index]]
  security_groups    = [aws_security_group.sg-main.id]

  tags = {
    Name = format("%s-bigip-int-%s-%s", var.prefix, count.index, random_id.id.hex)
    f5_cloud_failover_label = "mydeployment"
  }
}