#!/bin/bash
clear

# Exit early if any of the commands fails
set -e

echo "============================================"
echo "Installing Theano"
echo "============================================"

sudo apt-get install -y python-numpy python-scipy python-dev python-pip python-nose g++ libopenblas-dev git

cd /opt
sudo mkdir theano
pip install --upgrade pip
sudo pip install Theano

echo "============================================"
echo "Finished installing Theano"
echo "============================================"