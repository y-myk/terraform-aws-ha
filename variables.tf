#variable vault_addr {}

#variable vault_token {}

variable "ec2_key_name" {
  default = "ymyk"
}

variable uname {
  default = "admin"
}

variable upassword {
  default = "Fr5Tyh7iKl"
}

variable licensekey {
  default = ["XXXXX-KYDWZ-OIKHH-YYYYY-QILXQIO", "XXXXX-KYDWZ-OIKHH-YYYYY-QILXQIH"]
}

variable "region" {
  default = "us-east-1"
}

variable "BIG-IP_ami" {
  default = "ami-0a6b4a1889304929a"
  #default = "ami-03618146485508c81"
  #default = "ami-0763a836ff06bd7f3"
}

variable adminSrcRange {
  default = "0.0.0.0/0"
  description = "My admin source range"
}

variable adminSrcRange2 {
  default = "0.0.0.0/0"
  description = "My admin source range"
}
variable DO_URL {
  default = "https://github.com/F5Networks/f5-declarative-onboarding/releases/download/v1.13.0/f5-declarative-onboarding-1.13.0-5.noarch.rpm"
}

variable AS3_URL {
  default = "https://github.com/F5Networks/f5-appsvcs-extension/releases/download/v3.19.1/f5-appsvcs-3.19.1-1.noarch.rpm"
}

variable TS_URL {
  default = "https://github.com/F5Networks/f5-telemetry-streaming/releases/download/v1.11.0/f5-telemetry-1.11.0-1.noarch.rpm"
}

variable CF_URL {
  default = "https://github.com/F5Networks/f5-cloud-failover-extension/releases/download/v1.2.0/f5-cloud-failover-1.2.0-0.noarch.rpm"
}

variable libs_dir {
  default = "/config/cloud/aws/node_modules"
}

variable onboard_log {
  default = "/var/log/startup-script.log"
}

variable rest_do_uri { default = "/mgmt/shared/declarative-onboarding" }
variable rest_as3_uri { default = "/mgmt/shared/appsvcs/declare" }
variable rest_do_method { default = "POST" }
variable rest_as3_method { default = "POST" }
variable rest_do_file { default = "do_data.json" }
variable rest_as3_file { default = "as3_data.json" }
variable cloud-init_file {
  default = ["cloud-init0.render", "cloud-init1.render"]
}

variable "management_subnet_offset" {
  default = 0
}

variable "external_subnet_offset" {
  default = 10
}

variable "internal_subnet_offset" {
  default = 20
}

variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "prefix" {
  default = "ymyk-tf"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "mgmt_private_ip" {
  default = ["10.0.0.4", "10.0.1.4"]
}

variable "ext_selfip" {
  default = ["10.0.10.4", "10.0.11.4"]
}

variable "app1_vip" {
  default = ["10.0.10.5", "10.0.11.5"]
}

variable "f5_cloud_failover_vips_app1" {
  default = "10.0.10.5,10.0.11.5"
}

variable "int_selfip" {
  default = ["10.0.20.4", "10.0.21.4"]
}

variable "default_gateway_ip" {
  default = ["10.0.10.1", "10.0.11.1"]
}

variable "haDirection" {
  default = ["to-group", "from-group"]
}

variable "hostname"  {
  default = ["1.ab.gmbh", "2.ab.gmbh"]
}

variable "members"  {
  default = "[\"1.ab.gmbh\", \"2.ab.gmbh\"]"
}

variable "device-group-members"  {
  default = "1.ab.gmbh 2.ab.gmbh"
}

variable "alien_ip_range" {
  default = "192.168.0.0/24"
}
