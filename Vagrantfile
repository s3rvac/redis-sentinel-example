Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
    vb.cpus = "1"
  end

  config.vm.define "redis1" do |redis1|
    redis1.vm.network "private_network", ip: "192.168.0.11"
    redis1.vm.hostname = "redis1"
  end
  config.vm.define "redis2" do |redis2|
    redis2.vm.network "private_network", ip: "192.168.0.12"
    redis2.vm.hostname = "redis2"
  end
  config.vm.define "redis3" do |redis3|
    redis3.vm.network "private_network", ip: "192.168.0.13"
    redis3.vm.hostname = "redis3"
  end
end
