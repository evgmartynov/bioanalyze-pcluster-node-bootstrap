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
# Downloads, unzips and merges the SwissProt and TrEMBL databases for
# AlphaFold-Multimer.
#
# Usage: bash download_uniprot.sh /path/to/download/directory
set -e

export local_user="ubuntu"
if ! command -v apt-get &> /dev/null
then
        echo "on os alinux2"
        export local_user="ec2-user"
        sudo yum install -y aria2
fi
if  command -v apt-get &> /dev/null
then
        sudo apt-get install -y aria2
fi

DOWNLOAD_DIR="/scratch/reference/alphafold"
ROOT_DIR="${DOWNLOAD_DIR}/uniprot"

TREMBL_SOURCE_URL="ftp://ftp.ebi.ac.uk/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_trembl.fasta.gz"
TREMBL_BASENAME=$(basename "${TREMBL_SOURCE_URL}")
TREMBL_UNZIPPED_BASENAME="${TREMBL_BASENAME%.gz}"

SPROT_SOURCE_URL="ftp://ftp.ebi.ac.uk/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz"
SPROT_BASENAME=$(basename "${SPROT_SOURCE_URL}")
SPROT_UNZIPPED_BASENAME="${SPROT_BASENAME%.gz}"

mkdir --parents "${ROOT_DIR}"
aria2c "${TREMBL_SOURCE_URL}" --dir="${ROOT_DIR}"
aria2c "${SPROT_SOURCE_URL}" --dir="${ROOT_DIR}"
pushd "${ROOT_DIR}"
gunzip "${ROOT_DIR}/${TREMBL_BASENAME}"
gunzip "${ROOT_DIR}/${SPROT_BASENAME}"

# Concatenate TrEMBL and SwissProt, rename to uniprot and clean up.
cat "${ROOT_DIR}/${SPROT_UNZIPPED_BASENAME}" >> "${ROOT_DIR}/${TREMBL_UNZIPPED_BASENAME}"
mv "${ROOT_DIR}/${TREMBL_UNZIPPED_BASENAME}" "${ROOT_DIR}/uniprot.fasta"
rm "${ROOT_DIR}/${SPROT_UNZIPPED_BASENAME}"
popd
