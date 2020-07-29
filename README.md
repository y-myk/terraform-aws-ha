# terraform-aws-ha 

After deploying configuration from this repo you get the following:

- two BIG-IP VMs (15.1.0.4) in different availability zones in AWS
- Declarative Onboarding (DO) is installed on each VM
- DO declaration is passed to cloud-init via Terraform to onboard BIG-IPs (VLANs. self-ips, etc.)
- DSC is configured using the following tmsh commands in cloudinit.txt file (since DO is not currently able to configure cross-AZ clusters: https://github.com/F5Networks/f5-declarative-onboarding/issues/141):

tmsh modify /cm trust-domain /Common/Root add-device { device-ip ${remoteHost} device-name ${remoteHostName} username ${uname} password ${upassword} ca-device true }
tmsh create /cm device-group failoverGroup type sync-failover
tmsh modify /cm device-group failoverGroup devices add { ${members} }
tmsh run /cm config-sync ${haDirection} failoverGroup

## Installation

```
git clone https://github.com/y-myk/terraform-aws-ha.git
cd terraform-aws-ha
terraform init
terraform plan
terraform apply
```

## Background info

cloud-init "write_files" and "runcmd" modules are used to create default route in "LOCAL_ONLY" folder on each BIG-IP (this is required since BIG-IPs are in different AZs and config-sync subnets are different on each BIG-IP). "tmos_declared" module is then used to send DO declaration to each BIG-IP.

DO configuration is composed from the following two resources:

Cloud-init reference: https://clouddocs.f5.com/cloud/public/v1/shared/cloudinit.html
DO declaration to setup DSC: https://clouddocs.f5.com/products/extensions/f5-declarative-onboarding/latest/bigip-examples.html
