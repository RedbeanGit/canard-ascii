Vagrant.configure("2") do |config|
  (1..4).each do |i|
    config.vm.define "worker#{i}" do |worker|
      worker.vm.box = "generic/ubuntu2004"
      worker.vm.hostname = "worker#{i}"
      worker.vm.network  :private_network, ip: "192.168.33.1#{i}"
      worker.vm.provider "virtualbox" do |v|  
        v.memory = 512
        v.cpus = 1
      end
    end
  end
end
