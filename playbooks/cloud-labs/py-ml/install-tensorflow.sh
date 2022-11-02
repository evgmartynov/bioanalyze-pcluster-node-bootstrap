#!/usr/bin/env bash

#SBATCH --partition dev
#SBATCH --constraint m5a4xlarge
#SBATCH --time 1-00:00:00
#SBATCH --exclusive

export SPACK_ROOT=/apps/spack/0.19.0
source /apps/spack/0.19.0/share/spack/setup-env.sh

# First try to install with the binary cache
spack install \
  -j 4 \
  --no-check-signature \
  --no-checksum \
  --use-cache \
  --reuse    \
  py-tensorflow@2.10.0 +cuda \
  py-torch@1.12.1 +cuda \
  py-scikit-learn \
  py-scikit-image \
  py-scipy \
  py-scikit-optimize \
  py-scientificpython \
  py-ipykernel@6.16.0

spack install \
  -j 4 \
  --no-check-signature \
  --no-checksum \
  --no-cache \
  --reuse    \
  py-tensorflow@2.10.0 +cuda \
  py-torch@1.12.1 +cuda \
  py-scikit-learn \
  py-scikit-image \
  py-scipy \
  py-scikit-optimize \
  py-scientificpython \
  py-ipykernel@6.16.0
