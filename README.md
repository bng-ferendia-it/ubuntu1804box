This is a Ubuntu 18.04 Bionic 64 development box. 
It is intended to be used with Vagrant and Virtual Box. You need to have Vagrant and VirtualBox installed on your HOST machine.

The box is provisioned with Ansible. 
If you provision it on Windows, than the box provisiones itself with Ansible inside the box, due to problems with Ansible and Windows.
If you provision the box on Linux, than it will default to the HOST machine Ansible.

Steps: 

1. make a development directory where you intend to work on your project
2. go to that diorectory and git clone this repe in there
3. vagrant up --provision
4. vagrant ssh gets you into the box if needed. you are now in /vagrant directory
4. you will have a "htdocs" directory after the box starts on your HOST machine
5. "htdocs" is the same you see on the GUEST machine after "vagrant ssh" and "cd /vagrant" with "ls -lsa"
6. you can put your web project code into "htdocs" in a distinct project directory, for example "mkdir MyProjectName" inside "htdocs" and clone your project repo inside there.