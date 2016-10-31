#!/bin/bash

# Exit early if any of the commands fails
set -e

# Some libraries for compiling Caffe with Python support. Not
# including support for OpenCV, LevelDB or LMDB since we're not
# training, only using it for inference.

# References:
# http://caffe.berkeleyvision.org/installation.html#prerequisites
# http://caffe.berkeleyvision.org/install_apt.html

CAFFE_LIBS='libprotobuf-dev libleveldb-dev protobuf-compiler libsnappy-dev libhdf5-serial-dev
          libopencv-dev libgflags-dev libgoogle-glog-dev libatlas-base-dev liblmdb-dev'
PYTHON_LIBS='python python-numpy python-scipy python-sklearn python-skimage
           python-protobuf python-virtualenv'

sudo apt-get install -y $CAFFE_LIBS $PYTHON_LIBS
sudo apt-get install -y --no-install-recommends libboost-all-dev

# Get and compile caffe. There aren't any recent releases, so just use
# the master branch for now.
cd /opt
sudo wget https://github.com/BVLC/caffe/archive/master.tar.gz
sudo tar zxf master.tar.gz
sudo mv caffe-master caffe
sudo rm master.tar.gz

cd caffe

echo 'USE_CUDNN := 1' >> /tmp/caffe_addendum
echo 'INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial' >> /tmp/caffe_addendum
echo 'LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/x86_64-linux-gnu/hdf5/serial' >> /tmp/caffe_addendum

cat Makefile.config.example /tmp/caffe_addendum > /tmp/Makefile.config
sudo mv /tmp/Makefile.config /opt/caffe/Makefile.config

sudo make all pycaffe -j8


echo "============================================"
echo "Finished installing caffe                   "
echo "============================================"
