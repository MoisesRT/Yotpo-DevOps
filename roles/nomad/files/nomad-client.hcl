data_dir = "/tmp/nomad"
client {
  enabled = true
  servers = ["172.20.20.10", "172.20.20.11", "172.20.20.12"]
}
consul {
  address = "172.20.20.10:8500"
}