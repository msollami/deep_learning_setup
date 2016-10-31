# This file lists the commands used to install CUDA 8.0 and cuDNN v5.1
# on an AWS g2.2xlarge Ubuntu 14.04 instance. The resulting AMI is
# then used as the base image for building the rest of the neocognitron.

# This package adds the appropriate sources for installing CUDA from NVIDIA's repos
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_8.0.44-1_amd64.deb

#wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_8.0.44-1_amd64.deb
#sudo dpkg -i cuda-repo-ubuntu1404_8.0.44-1_amd64.deb

# Update the package lists and upgrade and preexisting packages
sudo apt-get update
sudo apt-get -y upgrade

# Install the latest kernel with headers so we can compile the NVIDIA driver
sudo apt-get -y install linux-generic

# Install CUDA and the AWS CLI so that we can fetch the cuDNN libs from a private S3 bucket
sudo apt-get -y install awscli cuda

# Fetch and install the cuDNN libs. Requires the "neo_api" IAM role to access the private S3 bucket
wget http://ditto-configuration.s3.amazonaws.com/neocognitron/libcudnn5_5.1.5-1%2Bcuda8.0_amd64.deb
wget http://ditto-configuration.s3.amazonaws.com/neocognitron/libcudnn5-dev_5.1.5-1%2Bcuda8.0_amd64.deb

#aws --region us-east-1 s3 cp s3://ditto-configuration/neocognitron/libcudnn5-dev_5.1.5-1+cuda8.0_amd64.deb .
#aws --region us-east-1 s3 cp s3://ditto-configuration/neocognitron/libcudnn5_5.1.5-1+cuda8.0_amd64.deb .

sudo dpkg -i libcudnn5_5.1.5-1+cuda8.0_amd64.deb
sudo dpkg -i libcudnn5-dev_5.1.5-1+cuda8.0_amd64.deb

# sudo reboot