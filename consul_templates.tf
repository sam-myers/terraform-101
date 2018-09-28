data "template_file" "consul_install_script" {
  template = "${file("templates/consul/install.sh")}"

  vars {
    consul_version = "${var.consul_version}"
  }
}

data "template_file" "consul_service" {
  template = "${file("templates/consul/service")}"
}

data "template_file" "consul_config" {
  template = "${file("templates/consul/config.hcl")}"
}
