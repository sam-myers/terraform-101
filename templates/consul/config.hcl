datacenter = "demo"
data_dir = "/var/lib/consul"
log_level = "INFO"

bootstrap_expect = 1
bind_addr = "{{ GetPublicIP }}"

server = true
ui = true
