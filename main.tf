#provider "vault" {
#  address = var.vault_addr
#  token   = var.vault_token
#}

#data "vault_aws_access_credentials" "creds" {
#  backend = "aws"
#  role    = "my-role"
#}

provider "aws" {
#  access_key = data.vault_aws_access_credentials.creds.access_key
#  secret_key = data.vault_aws_access_credentials.creds.secret_key
   region     = var.region
}

resource "random_id" "id" {
  byte_length = 2
}