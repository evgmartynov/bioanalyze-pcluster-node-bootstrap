#################################################################
# Custom Configuration
#################################################################

import json
import os
import batchspawner
import jupyter_rsession_proxy
import getpass
import os
from traitlets import Integer, Unicode, Float, Dict
from aws_pcluster_slurm_spawner import (PClusterSlurmSpawner, pcluster_spawner_template_paths)
from aws_pcluster_slurm_spawner.aws_pcluster_slurm_spawner import get_ec2_address

#################################################################
# CONSTANTS
#################################################################

JUPYTERHUB_BIND_PORT = 8000
JUPYTERHUB_API_PORT = 8081
JUPYTERHUB_CONNECT_IP = get_ec2_address()
API_TOKEN = "af744654eb3245cb039a5791a997352b606db9528ac5c2ed6fd6c3623193c0b0"

#################################################################
# Networking
#################################################################

c.JupyterHub.bind_url = f'http://0.0.0.0:{JUPYTERHUB_BIND_PORT}'
c.Application.log_level = 'DEBUG'
c.Spawner.default_url = '/lab'

# Hub IP
c.JupyterHub.hub_ip = '0.0.0.0'
c.JupyterHub.hub_port = JUPYTERHUB_API_PORT
c.JupyterHub.hub_connect_ip = JUPYTERHUB_CONNECT_IP

c.JupyterHub.db_url = 'sqlite:///jupyterhub.sqlite'
c.JupyterHub.cookie_secret_file = 'jupyterhub_cookie_secret'

#################################################################
# Authentication
#################################################################

c.Authenticator.admin_users = set(['ec2-user'])
c.JupyterHub.authenticator_class = 'jupyterhub.auth.PAMAuthenticator'
c.PAMAuthenticator.open_sessions = False

#################################################################
# Batchspawner
#################################################################

c.Spawner.debug = True
c.BatchSpawnerBase.debug = True
## Sometimes we have to wait awhile for a node to spin up
c.Spawner.http_timeout = 60
c.Spawner.start_timeout = 500

# ------------------------------------------------------------------------------
# BatchSpawnerBase configuration
#   Providing default values that we may omit in the profiles
# ------------------------------------------------------------------------------

c.BatchSpawnerBase.req_partition = 'dev'
c.BatchSpawnerBase.req_runtime = '1:00:00'
c.BatchSpawnerBase.req_options = ''

c.BatchSpawnerBase.req_prologue = """
# load modules
module load Miniconda3
module load jupyterlab
"""

c.JupyterHub.spawner_class = PClusterSlurmSpawner
c.JupyterHub.allow_named_servers = True

#################################################################
# Dask Gateway
#################################################################
c.JupyterHub.services = [
    {"name": "dask-gateway", "api_token": API_TOKEN}
]
