job "ping" {
  # This job is a "service" -- a single "instance" of it
  # - (https://www.nomadproject.io/docs/jobspec/schedulers.html)
  type = "service"
  # It's annoying that I _have_ to define this since it's the default...
  datacenters = [
    "dc1"]

  # Tasks can be grouped to ensure they run in the same nomad client
  # Useful if you need to ensure "sidecars" are located near one another
  #constraint {}

  group "ping" {
    count = 1

    # Getting down to brass-tacks here -- what is actually to be run
    task "ping" {
      # It's a docker container
      driver = "exec"

      # Here's the docker configuration(s)
      config {
        command = "bash"
        args = ["-c","echo PING | nc $REDIS_HOST $REDIS_PORT"]
      }
      template {
        data = <<EOH
        REDIS_HOST="{{ range service "redis" }}{{ .Address }}{{ end }}"
        REDIS_PORT="{{ range service "redis" }}{{ .Port }}{{ end }}"
        EOH
        destination = "/tmp/file.env"
        env = true
      }
    }
  }
}