Vagrant.configure("2") do |config|
  config.vm.define "baukis" do |baukis|
    baukis.vm.box = "ubuntu/trusty64"

    baukis.vm.provision :shell, inline: "apt-get update"
    baukis.vm.provision :shell, inline: "apt-get -y upgrade"
    baukis.vm.provision :shell, inline: "apt-get -y install build-essential"

    baukis.vm.provision :shell, path: "provision/chruby.sh"
    baukis.vm.provision :shell, path: "provision/ruby-install.sh"
    baukis.vm.provision :shell, path: "provision/ruby.sh"
    baukis.vm.provision :shell, path: "provision/rails.sh", privileged: false
    baukis.vm.provision :shell, path: "provision/mysql-server.sh"
    baukis.vm.provision :shell, path: "provision/postgresql-server.sh"
  end
end
