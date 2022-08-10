#!/usr/bin/env bash

#################################################################
# Run Dask Gateway
# this should be in
#################################################################

CONFIG_FILE="/apps/software-configs/jupyterhub/dask_gateway_config.py"
export PATH="/apps/easybuild/4.5.4/software/jupyterlab/2022.05.10/bin/:$PATH"

/apps/easybuild/4.5.4/software/jupyterlab/2022.05.10/bin/dask-gateway-server -f ${CONFIG_FILE}
