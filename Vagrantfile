Vagrant.configure("2") do |config|

  provisioner = Vagrant::Util::Platform.windows? ? :guest_ansible : :ansible

	config.vm.define "symfony" do |symfony|
		#base tpl for vbox
		symfony.vm.box = "ubuntu/bionic64"
		# domain on which our app runs
		symfony.vm.hostname = "symfony.dev"
		# IP address used by box
		symfony.vm.network "private_network", ip: "192.168.33.151"

		# tell vagrant to run ansible as a provisioner
		symfony.vm.provision provisioner do |ansible|
			# ansible playbook location
			ansible.playbook = "provisioning/playbook.yml"
		end
	end

	# access shared vagrant directory via NFS, otherwise slow on mac and windows
	config.vm.synced_folder ".", "/vagrant", type: "nfs"

	config.vm.provider "virtualbox" do |v|
		# tell vb to give maschine 2 GB ram and 2 cores
		v.memory = 2048
		v.cpus = 2
	end
end
