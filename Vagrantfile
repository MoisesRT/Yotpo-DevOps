Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.define "server1" do |server1|
      server1.vm.hostname = "server1"
      server1.vm.network "private_network", ip: "172.20.20.10"
      server1.vm.provision "file", source: "./consul.service", destination: "/home/vagrant/consul.service"
      server1.vm.provision "file", source: "./nomad-server.hcl", destination: "/home/vagrant/nomad.hcl"
      server1.vm.provision "shell", path: "./consul-provision.sh"
  end
  config.vm.define "server2" do |server2|
      server2.vm.hostname = "server2"
      server2.vm.network "private_network", ip: "172.20.20.11"
      server2.vm.provision "file", source: "./consul.service", destination: "/home/vagrant/consul.service"
      server2.vm.provision "file", source: "./nomad-server.hcl", destination: "/home/vagrant/nomad.hcl"
      server2.vm.provision "shell", path: "./consul-provision.sh"
  end
  config.vm.define "server3" do |server3|
      server3.vm.hostname = "server3"
      server3.vm.network "private_network", ip: "172.20.20.12"
      server3.vm.provision "file", source: "./consul.service", destination: "/home/vagrant/consul.service"
      server3.vm.provision "file", source: "./nomad-server.hcl", destination: "/home/vagrant/nomad.hcl"
      server3.vm.provision "shell", path: "./consul-provision.sh"
  end
  config.vm.define "server4" do |server4|
      server4.vm.hostname = "server4"
      server4.vm.network "private_network", ip: "172.20.20.13"
      server4.vm.provision "file", source: "./nomad-client.hcl", destination: "/home/vagrant/nomad.hcl"
  end
  config.vm.provision "file", source: "./nomad.service", destination: "/home/vagrant/nomad.service"
  config.vm.provision "shell", path: "./nomad-provision.sh"
  config.vm.provision "shell", inline: "sudo echo '' > /etc/resolvconf/resolv.conf.d/head"
  config.vm.provision "shell", inline: "sudo echo nameserver 172.20.20.10 >> /etc/resolvconf/resolv.conf.d/head"
  config.vm.provision "shell", inline: "sudo echo nameserver 172.20.20.11 >> /etc/resolvconf/resolv.conf.d/head"
  config.vm.provision "shell", inline: "sudo echo nameserver 172.20.20.12 >> /etc/resolvconf/resolv.conf.d/head"
  config.vm.provision "shell", inline: "sudo systemctl restart networking"
end