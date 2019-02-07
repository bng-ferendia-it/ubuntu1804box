Vagrant.configure("2") do |config|

	config.vm.provider "virtualbox" do |v|
		v.name = "ubu18webdev"
		v.gui = false
		v.memory = 4096
		v.cpus = 1
	end

    #provisioner = Vagrant::Util::Platform.windows? ? :guest_ansible : :ansible

	config.vm.define "symfony" do |symfony|
		#base tpl for vbox
		symfony.vm.box = "ubuntu/bionic64"
		# domain on which our app runs
		# symfony.vm.hostname = "symfony.dev"
		# IP address used by box
		#symfony.vm.network "private_network", ip: "192.168.33.151"
		symfony.vm.network "private_network", ip: "10.0.15.42"

		# tell vagrant to run ansible as a provisioner
		symfony.vm.provision "ansible_local" do |ansible|
			ansible.become = true
			ansible.playbook = "provisioning/playbook.yml"
			ansible.galaxy_role_file = "provisioning/requirements.yml"
			ansible.galaxy_roles_path = "/etc/ansible/roles"
			ansible.galaxy_command = "sudo ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path} --force"
		end
	end

	# access shared vagrant directory via NFS, otherwise slow on mac and windows
	# config.vm.synced_folder ".", "/vagrant", type: "nfs"

	# access shared via samba - windows add network drive - because simlinks
	#config.vm.synced_folder ".", "/vagrant", type: "smb"



	# Show a message after box startup
	config.vm.post_up_message = "
	Welcome to the DEV Box.

    ________  _______________   ____ __________ ________  ____  ___
	\______ \ \_   _____/\   \ /   / \______   \\_____  \ \   \/  /
 	|    |  \ |    __)_  \   Y   /   |    |  _/ /   |   \ \     / 
 	|    `   \|        \  \     /    |    |   \/    |    \/     \ 
	/_______  /_______  /   \___/     |______  /\_______  /___/\  \
    	    \/        \/                     \/         \/      \_/


	Add an entry to hour host machine's hostfile e.g. '192.168.33.151  crm-sf3.local'.
	After that you can open 'http://crm-sf3.local:8080' in your browser to access the symfony application.


	Hints:
	- You might want to increase the php memory limit in /etc/php/7.2/fpm/php.ini
	"

end
