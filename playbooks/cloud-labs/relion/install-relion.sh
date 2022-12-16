#!/usr/bin/env bash

#SBATCH --partition dev
#SBATCH --constraint m5a4xlarge
#SBATCH --time 1-00:00:00
#SBATCH --exclusive

spack install \
  --no-check-signature \
  --no-checksum \
  --use-cache \
  relion@3.1.3 \
  relion@4.0-beta

spack install \
  --no-check-signature \
  --no-checksum \
  --use-cache \
  relion@3.1.3 ~mklfft ~cuda \
  relion@4.0-beta ~mklfft ~cuda \
  relion@3.1.3 ~mklfft +cuda \
  relion@4.0-beta ~mklfft +cuda

