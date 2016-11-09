#!/bin/bash
clear

# Exit early if any of the commands fails
set -e

echo "============================================"
echo "Configuring paths                           "
echo "============================================"

# Notes: 
#	- dlib is python setup.py installed
#	- opencv is apt-get installed
# 	- theano is pip installed
 
echo "export PATH=$PATH:/usr/local/cuda-8.0/bin:/opt/torch/install/bin" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/caffe/python:/opt/mxnet/lib:/usr/local/cuda-8.0/lib64:/opt/torch/install/bin" >> ~/.bashrc
echo 'export PYTHONPATH=$PYTHONPATH:/opt/mxnet/python:/opt/tensorflow/tensorflow:/opt/caffe/python' >> ~/.bashrc
echo "export CUDA_HOME=/usr/local/cuda" >> ~/.bashrc


echo "============================================"
echo "Install scripts finished                    "
echo "============================================"

source ~/.bashrc
exec bash

echo "============================================"
echo "Restart device to complete installation     "
echo "============================================"
