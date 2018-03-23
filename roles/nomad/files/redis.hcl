job "redis" {
  # This job is a "service" -- a single "instance" of it
  # - (https://www.nomadproject.io/docs/jobspec/schedulers.html)
  type = "service"

  # It's annoying that I _have_ to define this since it's the default...
  datacenters = [
    "dc1"]

  # Tasks can be grouped to ensure they run in the same nomad client
  # Useful if you need to ensure "sidecars" are located near one another
  #constraint {}

  group "redis" {
    count = 1

    # Getting down to brass-tacks here -- what is actually to be run
    task "redis" {
      # It's a docker container
      driver = "docker"

      # Here's the docker configuration(s)
      config {
        image = "redis:3.2.11"
        port_map {
          redis_port = 6379
        }
      }
      resources {
        network {
          port "redis_port" {
            static = 6379
          }
        }
      }

      service {
        name = "redis"
        port = "redis_port"
      }
    }
  }
}