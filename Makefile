install:
	sudo yum install -y ansible
	sudo ansible-galaxy install evandam.conda

apply:
	echo "apply"
	sudo ansible-playbook playbooks/head-node/prepare.yaml
