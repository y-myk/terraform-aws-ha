resource "aws_instance" "bigip-vm" {
  ami                         = var.BIG-IP_ami 
  instance_type               = "m4.xlarge"
  key_name                    = var.ec2_key_name
  user_data = base64encode(data.template_file.cloud-init[count.index].rendered)
  count     = length(var.azs)
  iam_instance_profile  =   aws_iam_instance_profile.CFE_profile.name

  tags = {
    Name = format("%s-bigip-vm-%s-%s", var.prefix, count.index, random_id.id.hex)
  }

  network_interface {
    network_interface_id      = aws_network_interface.bigip-mgmt[count.index].id
    device_index              = 0
  }

  network_interface {
    network_interface_id      = aws_network_interface.bigip-ext[count.index].id
    device_index              = 1
  }

  network_interface {
    network_interface_id      = aws_network_interface.bigip-int[count.index].id
    device_index              = 2
  }
}