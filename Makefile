.PHONY : help
help : Makefile
	@echo "Commands to bootstrap your nodes"

install:
	@echo "Installing ansible"
	sudo yum install -y ansible
	# leave both in
	# we need the conda role as sudo and as the user!
	sudo ansible-galaxy install evandam.conda
	ansible-galaxy install evandam.conda


apply-compute: install
	# This is here as a place holder
	# Anything you add here will include the launch time of a node!
	echo "Nothing to do here"

apply: install
	echo "apply"
	ansible-playbook ./playbooks/shared/yum.yaml || echo "yum install had errors"
	ansible-playbook ./playbooks/head-node/spack.yaml
	ansible-playbook ./playbooks/head-node/prepare.yaml
	ansible-playbook ./playbooks/head-node/easybuild.yaml
	ansible-playbook ./playbooks/head-node/jupyterhub.yaml

# Software specific makes
easybuild:
	ansible-playbook ./playbooks/head-node/easybuild.yaml

spack:
	echo "Installing spack"
	ansible-playbook ./playbooks/head-node/spack.yaml

alphafold:
	echo "Installing alphafold"
	ansible-playbook ./playbooks/cloud-labs/alphafold/alphafold.yaml

alphafold/data:
	echo "Downloading alphafold data"
	ansible-playbook ./playbooks/cloud-labs/alphafold/download-data.yaml

gromacs:
	echo "Installing gromacs"
	ansible-playbook ./playbooks/cloud-labs/gromacs/gromacs.yaml
