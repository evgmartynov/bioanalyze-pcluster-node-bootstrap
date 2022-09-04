#!/usr/bin/env bash

#SBATCH --partition dev
#SBATCH --constraint m5a4xlarge
#SBATCH --time 04:00:00

# submit a job with a sleep 4h to allow for interactive

sleep 4h
