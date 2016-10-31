#!/bin/bash
clear

# Exit early if any of the commands fails
set -e

echo "============================================"
echo "Community AMI: ami-2ef48339" 
echo "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20160907.1"
echo "p2.xlarge + 20gb ssd" 
echo "ssh -i 'key.pem' ubuntu@ec2_ip_address.com"
echo "============================================"

echo "============================================"
echo "To verify new kernel requirement (>=3.18) run"
echo "uname -r"
echo "output should be; "
echo "4.4.0-36-generic "
echo "============================================"

# This archive (install.gz) was made by archiving the directory scripts/ containing all .sh files, by running this command;
# tar -zcvf install.gz scripts

# if you want to change something in one of the scripts and regenerate the archive:
# sudo apt install unzip

# Single line install script:
# wget http://public-fileshare.s3.amazonaws.com/install.gz; tar xzf install.gz; rm install.gz; cd scripts; chmod +x master_installer.sh;./master_installer.sh
echo "============================================"
echo "Fully automatic installs:                   "
echo "   - nvidia                                 "
echo "   - opencv                                 "
echo "   - dlib                                   "
echo "   - caffe                                  "
echo "   - mxnet                                  "
echo "   - theano                                 "
echo "                                            "
echo "Manual: (requires user input)               "
echo "   - Torch                                  "
echo "   - Tensorflow                             "
echo "============================================"


echo "============================================"
echo "This script takes about 2 hours to complete."
echo "============================================"


chmod +x pre_installer.sh
chmod +x nvidia_installer.sh
chmod +x caffe_installer.sh
chmod +x dlib_installer.sh
chmod +x mxnet_installer.sh
chmod +x theano_installer.sh
chmod +x torch_installer.sh
chmod +x tensorflow_installer.sh
chmod +x keras_installer.sh
chmod +x post_installer.sh


./pre_installer.sh
./nvidia_installer.sh
./caffe_installer.sh
./dlib_installer.sh
./mxnet_installer.sh
./theano_installer.sh
./torch_installer.sh
./tensorflow_installer.sh
./keras_installer.sh
./post_installer.sh


echo "============================================"
echo "Install scripts complete!                   "
echo "============================================"


# The script requires the following files to be hosted:

# nvideainstaller.sh (line 20): 
# http://.../cudnn-8.0-linux-x64-v5.1.tar;

# master_installer.sh (line 24): 
# http://.../install.gz;

# Once finished, try this:
# python -c "import dlib, cv2, mxnet, caffe, theano, tensorflow, keras"
