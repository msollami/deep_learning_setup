#!/bin/bash
clear

# Exit early if any of the commands fails
set -e

echo "============================================"
echo "Install script for Tensorflow"
echo "============================================"
#references;
#https://www.tensorflow.org/versions/r0.7/get_started/os_setup.html#installing-from-sources
#http://ramhiser.com/2016/01/05/installing-tensorflow-on-an-aws-ec2-instance-with-gpu-support/
#only r0.6 binaries worked with CUDA 7.0, isntall from source 

sudo apt-get install python3-numpy swig python3-dev python3-wheel -y

echo "============================================"
echo "Installing a oddly specific bzip version to prevent some stupid bug from messing things up"
echo "============================================"

cd /opt
sudo wget http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
sudo tar -zxvf bzip2-1.0.6.tar.gz
sudo rm bzip2-1.0.6.tar.gz
cd bzip2-1.0.6
sudo make


echo "============================================"
echo "Installing java"
echo "============================================"

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install oracle-java8-installer -y


echo "============================================"
echo "Installing bazel"
echo "============================================"

echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
cd /opt
sudo curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install -y bazel


echo "============================================"
echo "Installing tensorflow dependencies          "
echo "============================================"
sudo apt-get install -y python-numpy swig python-dev

echo "============================================"
echo "Installing tensorflow itself...             "
echo "important configuration sequence (mosly default but last option is important"
echo " enter, enter, N, N, enter, y, enter, enter, enter, enter, enter, 3.0" 
echo "                                             "
echo "Make sure to answer 3.0, so it will look like this;" 
echo "Cuda compute capabilities you want to build with.[Default is: '3.5,5.2']: 3.7" 
echo "nvidia Tesla K80 (AWS p2.xlarge instance)  = 3.7 "
echo "reference https://developer.nvidia.com/cuda-gpus"
echo "============================================"
cd /opt
sudo git clone --recurse-submodules https://github.com/tensorflow/tensorflow
cd tensorflow
sudo ./configure

sudo bazel build -c opt --config=cuda //tensorflow/cc:tutorials_example_trainer
sudo bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
sudo bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

#warning: tensorflow fails on wrong pip version
sudo easy_install pip==8.1.2
#warning: if the next line doesn't work look in /tmp/tensorflow_pkg directory (and modify the line below for the right version )
export tfwhl=$(ls /tmp/tensorflow_pkg/*.whl)
sudo pip install --upgrade  $tfwhl


echo "============================================"
echo "Finished installing tensorflow              "
echo "============================================"