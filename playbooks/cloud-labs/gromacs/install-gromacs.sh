#!/usr/bin/env bash

export SBATCH_PARTITION='dev'
export SBATCH_CONSTRAINT='m5a4xlarge'

export SPACK_ROOT=/apps/spack
source /apps/spack/share/spack/setup-env.sh
sudo chown -R ec2-user:ec2-user /apps/spack/

spack install \
  --no-check-signature \
  --no-checksum \
  gromacs@2021.1 \
  gromacs@2021 \
  gromacs@2022


spack -d install -v   \
  --no-check-signature \
  --no-checksum \
  gromacs@2022 +openmp +blas +lapack

spack -d install -v   \
  --no-check-signature \
  --no-checksum \
  gromacs@2021 +openmp +blas +lapack
