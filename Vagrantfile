Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.define "server1" do |server1|
      server1.vm.hostname = "server1"
      server1.vm.network "private_network", ip: "172.20.20.10"
      server1.vm.provision "ansible" do |ansible|
        ansible.playbook = "server.yml"
        ansible.raw_arguments = ["-e ansible_python_interpreter=/usr/bin/python3"]
      end
  end
  config.vm.define "server2" do |server2|
      server2.vm.hostname = "server2"
      server2.vm.network "private_network", ip: "172.20.20.11"
      server2.vm.provision "ansible" do |ansible|
        ansible.playbook = "server.yml"
        ansible.raw_arguments = ["-e ansible_python_interpreter=/usr/bin/python3"]
      end
  end
  config.vm.define "server3" do |server3|
      server3.vm.hostname = "server3"
      server3.vm.network "private_network", ip: "172.20.20.12"
      server3.vm.provision "ansible" do |ansible|
        ansible.playbook = "server.yml"
        ansible.raw_arguments = ["-e ansible_python_interpreter=/usr/bin/python3"]
      end      
  end
  config.vm.define "server4" do |server4|
      server4.vm.hostname = "server4"
      server4.vm.network "private_network", ip: "172.20.20.13"
      server4.vm.provision "ansible" do |ansible|
        ansible.playbook = "client.yml"
        ansible.raw_arguments = ["-e ansible_python_interpreter=/usr/bin/python3"]
      end      
  end
end