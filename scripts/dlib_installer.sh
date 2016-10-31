#!/bin/bash

# Exit early if any of the commands fails
set -e

echo "============================================"
echo "Installing dlib" 
echo "============================================"
#reference http://npatta01.github.io/2015/08/10/dlib/

sudo apt-get install -y cmake libboost-all-dev python-skimage python-numpy python-scipy python-dev python-pip python-nose g++ libopenblas-dev git
pip install --upgrade pip

cd /opt
sudo wget https://github.com/davisking/dlib/archive/v19.0.tar.gz
sudo tar -zxvf v19.0.tar.gz
sudo rm -rf v19.0.tar.gz
cd dlib-19.0

sudo python setup.py install --yes DLIB_JPEG_SUPPORT

echo "============================================"
echo "To test dlib run" 
echo "python /opt/dlib-19.0/python_examples/svm_rank.py" 
echo "============================================"