#!/usr/bin/env bash

export SPACK_ROOT=/apps/spack

sudo mkdir -p ${SPACK_ROOT}
sudo chown ec2-user:ec2-user ${SPACK_ROOT}

# Install latest spack release

git clone https://github.com/spack/spack.git ${SPACK_ROOT}
cd ${SPACK_ROOT}
echo "export SPACK_ROOT=$SPACK_ROOT" > spack.sh
echo "source $SPACK_ROOT/share/spack/setup-env.sh" >> spack.sh
sudo mv spack.sh /etc/profile.d/spack.sh
source ${SPACK_ROOT}/share/spack/setup-env.sh
