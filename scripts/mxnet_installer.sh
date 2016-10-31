#!/bin/bash
clear

# Exit early if any of the commands fails
set -e


echo "============================================"
echo "Install script v4 for MXNet on AWS & Ubuntu 14.04"
echo "--------------------------------------------"
echo "Runs on Community AMI > ami-1117a87a [Ubuntu 14.04 - NVIDIA CUDA base image (g2)]  + g2.2xlarge" 
echo "ssh into your instance; ssh -i 'your_key.pem' ubuntu@[code].compute-1.amazonaws.com"
echo "Check if cuda is running; run: nvidia-smi"
echo "Check if kernel module and devices are present; run: lsmod | grep -i nvidia"
echo "if it looks okay execute this install script"
echo "============================================"

echo "============================================"
echo "Installing some requirements (including opencv libraries etc)" 
echo "============================================"

sudo apt-get install -y curl libssl-dev libcurl4-openssl-dev build-essential git libblas-dev libatlas-base-dev
sudo apt-get install -y libopencv-dev python-opencv

echo "============================================"
echo "Installing mxnet" 
echo "============================================"

cd /opt
sudo git clone --recursive https://github.com/dmlc/mxnet
cd mxnet
sudo cp make/config.mk config.mk.example

echo "USE_CUDA=1" >> /tmp/mxnet_addendum
echo "USE_CUDA_PATH=/usr/local/cuda" >> /tmp/mxnet_addendum
echo "USE_CUDNN=1" >> /tmp/mxnet_addendum
echo "USE_BLAS=atlas" >> /tmp/mxnet_addendum
echo "USE_DIST_KVSTORE = 1" >> /tmp/mxnet_addendum
echo "USE_S3=1" >> /tmp/mxnet_addendum

cat config.mk.example /tmp/mxnet_addendum > /tmp/config.mk
sudo mv /tmp/config.mk /opt/mxnet/

cd dmlc-core
sudo make -j4
cd ..

sudo make -j8


# echo "============================================"
# echo "Installing imaging tools for MXNet Examples " 
# echo "============================================"

# sudo apt-get install -y python-pip
# cd /home/ubuntu/mxnet/python
# python setup.py install --user
# sudo ln /dev/null /dev/raw1394
# cd ~/


# #skimage is a part of Cython which in turn is a superset of python
# sudo apt-get install -y python-matplotlib python-numpy python-pil python-scipy
# sudo apt-get install -y build-essential cython
# sudo pip install --upgrade cython

# sudo apt-get install -y libjpeg-dev
# sudo apt-get install -y libjpeg8-dev

# sudo pip install git+https://github.com/scikit-image/scikit-image
# sudo pip install --no-cache-dir -I pillow


echo "============================================"
echo "Finished installing MXNET"
echo "============================================"
