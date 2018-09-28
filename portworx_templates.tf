data "template_file" "portworx_install_script" {
  template = "${file("templates/portworx/install.sh")}"

  vars {
    portworx_container = "${var.portworx_container}"
  }
}
