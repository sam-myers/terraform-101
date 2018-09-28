data_dir  = "/var/lib/nomad"

consul {
  verify_ssl = false
}

server {
  enabled          = true
  bootstrap_expect = 1
}

client {
  enabled = true
}
