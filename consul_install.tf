resource "null_resource" "install_consul" {
  triggers {
    install_script = "${data.template_file.consul_install_script.rendered}"
    systemctl_service = "${data.template_file.consul_service.rendered}"
    config_file = "${data.template_file.consul_config.rendered}"
  }

  connection {
    host = "${digitalocean_droplet.demo_droplet.ipv4_address}"
    type = "ssh"
    user = "root"
    private_key = "${data.template_file.private_key.rendered}"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /etc/consul/",
      "mkdir -p /var/lib/consul/"
    ]
  }

  provisioner "file" {
    destination = "/etc/systemd/system/consul.service"
    content = "${data.template_file.consul_service.rendered}"
  }

  provisioner "file" {
    destination = "/etc/consul/config.hcl"
    content = "${data.template_file.consul_config.rendered}"
  }

  provisioner "remote-exec" {
    inline = "${data.template_file.consul_install_script.rendered}"
  }
}
