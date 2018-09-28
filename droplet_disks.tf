resource "digitalocean_volume" "demo_disk" {
  count = 3

  name = "demo-disk-${count.index}"
  region = "${var.do_region}"
  size = 10
}
