variable "account" {
  default = ""
}

variable "region" {
  default = "us-west-2"
}

variable "environment" {
  default = "stage"
}

variable "service_name" {
  default = "limed-haul"
}

variable "ami" {}

variable "ssh_key_file" {
  default = ""
}

variable "ssh_key_name" {
  default = ""
}

variable "acme_email" {
  default = "limed@mozilla.com"
}

variable "technical_owner" {
  default = "infra-aws@mozilla.com"
}

variable "nubis_sudo_groups" {
  default = "nubis_global_admins,team_webops"
}
