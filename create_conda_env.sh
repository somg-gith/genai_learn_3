#!/bin/bash

# Script to create a conda environment in GitHub Codespace

# Check if conda is installed
if ! command -v conda &> /dev/null; then
    echo "Conda not found. Installing Miniconda..."
    
    # Download and install Miniconda
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
    bash miniconda.sh -b -p $HOME/miniconda
    rm miniconda.sh
    
    # Initialize conda for bash
    export PATH="$HOME/miniconda/bin:$PATH"
    conda init bash
    
    # Source the bashrc to make conda available in this session
    source ~/.bashrc
fi

# Create a new conda environment named 'myenv' with Python 3.10
echo "Creating conda environment 'myenv' with Python 3.10..."
conda create -n myenv python=3.10 -y

# Activate the environment
echo "Activating the environment..."
conda activate myenv

# Install common packages (optional, customize as needed)
echo "Installing common packages..."
conda install -c conda-forge jupyter numpy pandas matplotlib scikit-learn -y

echo "Conda environment 'myenv' created and activated. You can now use it for your projects."