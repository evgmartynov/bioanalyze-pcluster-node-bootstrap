#!/usr/bin/env bash

#SBATCH --partition dev
#SBATCH --constraint m5a4xlarge
#SBATCH --time 1-00:00:00
#SBATCH --exclusive

export SPACK_ROOT=/apps/spack
source /apps/spack/share/spack/setup-env.sh

# First try to install with the binary cache
spack install \
  -j 4 \
  --no-check-signature \
  --no-checksum \
  --use-cache \
  --reuse    \
  gromacs@2021 \
  gromacs@2022

spack install \
  -j 4 \
  --no-check-signature \
  --no-checksum \
  --use-cache \
  --reuse    \
  gromacs@2022 +openmp +blas +lapack \
  gromacs@2021 +openmp +blas +lapack

spack install \
  -j 4 \
  --no-check-signature \
  --no-checksum \
  --no-cache \
  --reuse    \
  gromacs@2022 +openmp +blas +lapack \
  gromacs@2021 +openmp +blas +lapack

spack install \
  -j 4 \
  --no-check-signature \
  --no-checksum \
  --no-cache \
  --reuse    \
  gromacs@2021 \
  gromacs@2022
