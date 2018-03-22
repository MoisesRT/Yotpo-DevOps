Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision "file", source: "./consul.service", destination: "/home/vagrant/consul.service"
  config.vm.provision "file", source: "./nomad.service", destination: "/home/vagrant/nomad.service"
  config.vm.provision "file", source: "./nomad.hcl", destination: "/home/vagrant/nomad.hcl"
  config.vm.provision "shell", path: "./consul-provision.sh"
  config.vm.provision "shell", path: "./nomad-provision.sh"
  config.vm.define "server1" do |server1|
      server1.vm.hostname = "server1"
      server1.vm.network "private_network", ip: "172.20.20.10"
  end 
  config.vm.define "server2" do |server2|
      server2.vm.hostname = "server2"
      server2.vm.network "private_network", ip: "172.20.20.11"
  end 
  config.vm.define "server3" do |server3|
      server3.vm.hostname = "server3"
      server3.vm.network "private_network", ip: "172.20.20.12"
  end     
end