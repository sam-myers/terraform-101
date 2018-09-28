data "template_file" "nomad_install_script" {
  template = "${file("templates/nomad/install.sh")}"

  vars {
    nomad_version = "${var.nomad_version}"
  }
}

data "template_file" "nomad_service" {
  template = "${file("templates/nomad/service")}"
}

data "template_file" "nomad_config" {
  template = "${file("templates/nomad/config.hcl")}"
}
