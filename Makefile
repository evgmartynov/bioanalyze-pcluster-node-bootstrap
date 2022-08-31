install:
	sudo yum install -y ansible
	# leave both in
	# we need the conda role as sudo and as the user!
	sudo ansible-galaxy install evandam.conda
	ansible-galaxy install evandam.conda


apply-compute: install
	echo "Nothing to do here"
	#sudo ansible-playbook ./playbooks/shared/yum.yaml || echo "Yum install had errors"
	#sudo ansible-playbook ./playbooks/shared/spack.yaml || echo "Spack install had errors"

apply: install
	echo "apply"
	sudo ansible-playbook ./playbooks/shared/yum.yaml || echo "yum install had errors"
	sudo ansible-playbook ./playbooks/head-node/spack.yaml
	sudo ansible-playbook ./playbooks/shared/spack.yaml
	sudo ansible-playbook ./playbooks/head-node/prepare.yaml
	ansible-playbook ./playbooks/head-node/easybuild.yaml
	sudo ansible-playbook ./playbooks/head-node/jupyterhub.yaml
