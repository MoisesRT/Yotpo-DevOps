data_dir = "/tmp/nomad"
server {
  enabled = true
  bootstrap_expect = 3
  retry_join = ["172.20.20.10","172.20.20.11","172.20.20.12"]
}