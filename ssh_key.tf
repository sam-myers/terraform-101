resource "digitalocean_ssh_key" "demo_key" {
  name = "demo_ssh_key"
  public_key = "${data.template_file.public_key.rendered}"
}

data "template_file" "public_key" {
  template = "${file("/Users/sam/.ssh/id_rsa.pub")}"
}

data "template_file" "private_key" {
  template = "${file("/Users/sam/.ssh/id_rsa")}"
}
