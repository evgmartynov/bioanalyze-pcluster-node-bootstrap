#!/usr/bin/env bash

#SBATCH --partition dev
#SBATCH --constraint m5a4xlarge
#SBATCH --time 1-00:00:00
#SBATCH --exclusive

# First try to install with the binary cache
spack install \
  --no-check-signature \
  --no-checksum \
  --use-cache \
  --reuse    \
  r-tidyverse r-seurat \
  r-biocmanager r-biocinstaller \
  r-devtools r-biomart r-biobase \
  r-bigmemory \
  r-singlecellexperiment

spack install \
  --no-check-signature \
  --no-checksum \
  --no-cache \
  --reuse    \
  r-tidyverse r-seurat \
  r-biocmanager r-biocinstaller \
  r-devtools r-biomart r-biobase \
  r-bigmemory \
  r-singlecellexperiment
