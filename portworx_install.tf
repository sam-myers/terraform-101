resource "null_resource" "install_portworx" {
  depends_on = ["null_resource.install_consul"]

  triggers {
    droplet_id = "${digitalocean_droplet.demo.id}"
    install_script = "${data.template_file.portworx_install_script.rendered}"
  }

  connection {
    host = "${digitalocean_droplet.demo.ipv4_address}"
    type = "ssh"
    user = "root"
    private_key = "${data.template_file.private_key.rendered}"
  }

  provisioner "remote-exec" {
    inline = "${data.template_file.portworx_install_script.rendered}"
  }
}
