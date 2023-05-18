# Head node bootstrap for Paracrine

This file provides instructions on how to deploy Paracrine cluster head node using a Makefile.

The Makefile simplifies the process by providing a convenient interface for running and managing Ansible tasks.

# Prerequisites
Ensure that Ansible is installed on your system. You can install Ansible by:

```bash
make install
```

# Getting Started
Clone the repository: 
```bash
git clone <repository_url>
```

Navigate to the project directory: 
```bash
cd <project_directory>
```
The Makefile contains a series of targets that correspond to different Ansible tasks or playbook runs.
Open Makefile in text editor to see the list of available targets and their descriptions.

For default bootstrap scenario, run:
```bash
make apply
```
It will run set of playbooks to install default software:

- EasyBuild 4.5.4
   - Miniconda3 4.12.0
   - R-datascience-4
   - Nextflow 22.04.0
   - Pcluster-helpers 0.0.1
   - JupyterLab 2022.05.10

- Spack 0.19.1
   - R
   - Bioconductor
   - Tensorflow
   - Singularity
   - Lmod
   - PyMol

You have an options to run separate playbooks for desired software.
Choose the desired target and run it using the make command followed by the target name. For example, to run a playbook named alphafold.yaml, you can execute: make alphafold.

```bash
make *target*
```
Available targets:

```easybuild``` - Installing EasyBuild

```spack``` - Installing Spack

```alphafold``` - Installing Alphafold

```alphafold/data``` - Downloading Alphafold data

```gromacs``` - Installing Gromacs

```relion``` - Installing Relion

The target will execute the corresponding Ansible playbook and display the output in the terminal. You can monitor the progress and any errors that occur during execution.
