install:
	sudo yum install -y ansible
	sudo ansible-galaxy install evandam.conda

apply-compute: install
	sudo ansible-playbook ./playbooks/shared/spack.yaml

apply: install
	echo "apply"
	sudo ansible-playbook ./playbooks/shared/spack.yaml
	sudo ansible-playbook ./playbooks/head-node/prepare.yaml
	sudo ansible-playbook ./playbooks/head-node/spack.yaml
	ansible-playbook ./playbooks/head-node/easybuild.yaml
	sudo ansible-playbook ./playbooks/head-node/jupyterhub.yaml
