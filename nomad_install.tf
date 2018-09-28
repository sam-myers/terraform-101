resource "null_resource" "install_nomad" {
  depends_on = ["null_resource.install_consul"]

  triggers {
    droplet_id = "${digitalocean_droplet.demo.id}"
    install_script = "${data.template_file.nomad_install_script.rendered}"
    systemctl_service = "${data.template_file.nomad_service.rendered}"
    config_file = "${data.template_file.nomad_config.rendered}"
  }

  connection {
    host = "${digitalocean_droplet.demo.ipv4_address}"
    type = "ssh"
    user = "root"
    private_key = "${data.template_file.private_key.rendered}"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /etc/nomad/",
      "mkdir -p /var/lib/nomad/"
    ]
  }

  provisioner "file" {
    destination = "/etc/systemd/system/nomad.service"
    content = "${data.template_file.nomad_service.rendered}"
  }

  provisioner "file" {
    destination = "/etc/nomad/config.hcl"
    content = "${data.template_file.nomad_config.rendered}"
  }

  provisioner "remote-exec" {
    inline = "${data.template_file.nomad_install_script.rendered}"
  }
}
