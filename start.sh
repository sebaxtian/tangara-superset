#!/bin/bash

#
# Before running this script you must activate poetry shell.
# Run this script to set up the Superset environment before starting it.
#

# Create superset_config.py
SUPERSET_CONFIG=$PWD/superset_config.py
if [ -f "$SUPERSET_CONFIG" ]; then
    # Already exists
    echo "$SUPERSET_CONFIG exists."
else 
    touch $PWD/superset_config.py

    # Custom Superset Config File
    echo "# Custom Superset Config:" > $SUPERSET_CONFIG
    echo "# https://superset.apache.org/docs/installation/configuring-superset/" >> $SUPERSET_CONFIG
    echo "#" >> $SUPERSET_CONFIG
    SECRET_KEY=$(openssl rand -base64 42)
    echo "SECRET_KEY = '$SECRET_KEY'" >> $SUPERSET_CONFIG
    echo "PREVENT_UNSAFE_DB_CONNECTIONS = False" >> $SUPERSET_CONFIG
    echo "TALISMAN_ENABLED = False" >> $SUPERSET_CONFIG
fi

# Environment Variable SUPERSET_CONFIG_PATH
export SUPERSET_CONFIG_PATH=$PWD/superset_config.py

# Superset FLASK_APP Name
export FLASK_APP=superset

# Stating Superset development mode
superset run -h 0.0.0.0 -p 8088 --with-threads --reload --debugger
