# tangara-superset
This is the data intelligence web application, Superset, created to share Tangara analysis using the data from Tangara sensors.

## Requirements
- Python 3.10+
- Poetry 1.7+
    - [Install Poetry](https://python-poetry.org/docs/#installation)
- Superset 3.0.2+
    - [Installing Superset from Scratch](https://superset.apache.org/docs/installation/installing-superset-from-scratch)

## How to use

Please read and execute each step below:

### Step 1

Install poetry by script:
```bash
$promt> bash install-poetry.sh
```

### Step 2

Command to tell Poetry which Python version to use for the current project:

```bash
$promt> poetry env use 3.10
```

### Step 3

Activating the virtual environment:

```bash
$promt> poetry shell
```

### Step 4

OS Dependencies:

```bash
$(tangara-superset-py3.10)> sudo apt-get install build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev default-libmysqlclient-dev
```

Installing dependencies:

```bash
$(tangara-superset-py3.10)> poetry install --no-root
```

### Step 5

[Configuring Superset](https://superset.apache.org/docs/installation/configuring-superset/): To configure your application, you need to create a file **superset_config.py**

Please use the **superset_config.py.example** file as a basic configuration, and read the official documentation to ensure more specific configurations.

You can generate a strong secure key with:

```bash
$(tangara-superset-py3.10)> openssl rand -base64 42
```

Create an environment variable SUPERSET_CONFIG_PATH specifying the full path of the superset_config.py:

```bash
$(tangara-superset-py3.10)> export SUPERSET_CONFIG_PATH=$PWD/superset_config.py
```

### Step 6

Installing and Initializing Superset:

```bash
# you need to initialize the database
$(tangara-superset-py3.10)> superset db upgrade
# Superset SQLite database is created in: ~/.superset/superset.db
```

Finish installing by running through the following commands:

```bash
# Create an admin user in your metadata database (use `admin` as username to be able to load the examples)
$(tangara-superset-py3.10)> export FLASK_APP=superset
$(tangara-superset-py3.10)> superset fab create-admin

# Load some data to play with
$(tangara-superset-py3.10)> superset load_examples

# Create default roles and permissions
$(tangara-superset-py3.10)> superset init

# Build javascript assets
#$promt> cd superset-frontend
#$promt> npm ci
#$promt> npm run build
#$promt> cd ..

# To start a development web server on port 8088, use -p to bind to another port
$(tangara-superset-py3.10)> superset run -p 8088 --with-threads --reload --debugger
```

### Step 7

Starting Superset:

```bash
# Activating the virtual environment:
$promt> poetry shell
```

```bash
# Starting Superset Development Mode
$(tangara-superset-py3.10)> ./start.sh
```

### Optional

Displaying the environment information:

```bash
$promt> poetry env info
```

Deactivate the virtual environment and exit:

```bash
$(tangara-superset-py3.10)> exit
# To deactivate the virtual environment without leaving the shell use deactivate
$(tangara-superset-py3.10)> deactivate
```
