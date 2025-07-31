#!/bin/bash

# Download hfd.sh script
echo "Downloading hfd.sh..."
wget -O hfd.sh  https://hf-mirror.com/hfd/hfd.sh

# Add execution permission
echo "Adding execution permissions..."
chmod a+x hfd.sh

# Configure environment variables
echo "Configuring environment variables..."

# Define the environment variable line
ENV_LINE='export HF_ENDPOINT=https://hf-mirror.com'

# Check if the line already exists in .bashrc before adding
if ! grep -qxF "$ENV_LINE" ~/.bashrc; then
    echo "$ENV_LINE" >> ~/.bashrc
    echo "Added HF_ENDPOINT to ~/.bashrc"
else
    echo "HF_ENDPOINT already exists in ~/.bashrc, no duplicate added"
fi

# Get current script directory
SCRIPT_DIR=$(pwd)

# Define the PATH line
PATH_LINE="export PATH=\$PATH:$SCRIPT_DIR"

# Check if the PATH entry already exists before adding
if ! grep -qxF "$PATH_LINE" ~/.bashrc; then
    echo "$PATH_LINE" >> ~/.bashrc
    echo "Added script directory to PATH in ~/.bashrc"
    echo "Please run 'source ~/.bashrc' to apply changes immediately"
else
    echo "Script directory already in PATH, no duplicate added"
fi

echo "Installation process completed"
