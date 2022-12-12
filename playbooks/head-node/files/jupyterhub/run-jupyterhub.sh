#!/usr/bin/env bash

PORT_NUMBER=8001
lsof -i tcp:${PORT_NUMBER} | awk 'NR!=1 {print $2}' |  xargs -I {} kill {}
PORT_NUMBER=8000
lsof -i tcp:${PORT_NUMBER} | awk 'NR!=1 {print $2}' | xargs -I {} kill {}

CONFIG_FILE="/apps/software-configs/jupyterhub/jupyterhub_config.py"
/apps/easybuild/4.5.4/software/jupyterlab/2022.05.10/bin/jupyterhub -f ${CONFIG_FILE}
