#!/bin/bash
#
# Copyright 2021 DeepMind Technologies Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Downloads and unzips the Small BFD database for AlphaFold.
#
# Usage: bash download_small_bfd.sh /path/to/download/directory
set -e

export LOCAL_USER="ubuntu"
if ! command -v apt-get &> /dev/null
then
        echo "On OS Alinux2"
        export LOCAL_USER="ec2-user"
        sudo yum install -y aria2
fi
if  command -v apt-get &> /dev/null
then
        sudo apt-get install -y aria2
fi

DOWNLOAD_DIR="/scratch/reference/alphafold"

ROOT_DIR="${DOWNLOAD_DIR}/small_bfd"
SOURCE_URL="https://storage.googleapis.com/alphafold-databases/reduced_dbs/bfd-first_non_consensus_sequences.fasta.gz"
BASENAME=$(basename "${SOURCE_URL}")

mkdir --parents "${ROOT_DIR}"
aria2c "${SOURCE_URL}" --dir="${ROOT_DIR}"
pushd "${ROOT_DIR}"
gunzip "${ROOT_DIR}/${BASENAME}"
popd
