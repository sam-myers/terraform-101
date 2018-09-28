resource "digitalocean_droplet" "demo_droplet" {
  image = "ubuntu-18-04-x64"
  name = "demo"
  region = "${var.do_region}"
  size = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.demo_key.id}"]
  volume_ids = ["${digitalocean_volume.demo_disk.*.id}"]

  connection {
    host = "${digitalocean_droplet.demo_droplet.ipv4_address}"
    type = "ssh"
    user = "root"
    private_key = "${data.template_file.private_key.rendered}"
  }

  provisioner "remote-exec" {
    inline = ["${data.template_file.droplet_setup_script.rendered}"]
  }
}

data "template_file" "droplet_setup_script" {
  template = "${file("templates/droplet_setup.sh")}"
}
