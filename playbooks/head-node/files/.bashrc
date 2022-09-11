# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# TODO
# Once the Miniconda3 is installed
# get rid of this

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/ec2-user/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/ec2-user/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/ec2-user/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/ec2-user/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

#############################################################
# Lmod
#############################################################
source /usr/share/lmod/lmod/init/bash

#############################################################
# EasyBuild
#############################################################
export EASYBUILD_PREFIX=/apps/easybuild/4.5.4
export MODULEPATH=/apps/easybuild/4.5.4/modules/all
export ROBOT=/app/software-configs

#############################################################
# Spack
#############################################################
export SPACK_ROOT=/apps/spack
source /apps/spack/share/spack/setup-env.sh
