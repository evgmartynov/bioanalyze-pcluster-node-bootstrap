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
  r-shiny \
  shiny-server \
  rstudio

spack install \
  -j 4 \
  --no-check-signature \
  --no-checksum \
  --no-cache \
  --reuse    \
  r-shiny \
  shiny-server \
  rstudio
