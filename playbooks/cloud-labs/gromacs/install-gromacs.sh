#!/usr/bin/env bash

#SBATCH --partition dev
#SBATCH --constraint m5a4xlarge
#SBATCH --time 1-00:00:00
#SBATCH --exclusive

# First try to install with the binary cache
spack install \
  --no-check-signature \
  --no-checksum \
  gromacs@2021 \
  gromacs@2022 \
  gromacs@2022 +cuda +mpi \
  gromacs@2022 +cuda ~mpi \
  gromacs@2021 +cuda ~mpi \
  gromacs@2021 +cuda +mpi \
  gromacs@2022 +openmp +blas +lapack \
  gromacs@2021 +openmp +blas +lapack

