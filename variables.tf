variable "ssh_key_path" {
  description = "Path to SSH private key"
  default = "/Users/sam/.ssh/id_rsa"
}

variable "do_token" {
  description = "Digital Ocean API token"
  type = "string"
}

variable "do_region" {
  description = "Region to launch Digital Ocean resources in"
  type = "string"
  default = "sfo2"
}

variable "consul_version" {
  description = "Consul semantic version"
  default = "1.2.3"
}

variable "nomad_version" {
  description = "Nomad semantic version"
  default = "0.8.6"
}

variable "portworx_container" {
  description = "Portworx docker container"
  default = "portworx/px-dev:1.6.0"
}
