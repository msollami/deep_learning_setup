#!/bin/bash -e
clear

echo "================================================"
echo "Installing Torch (single manual step required) "
echo "================================================"
echo "Enter NO at the end of script when prompted."
#refrences; http://torch.ch
#refrences; https://github.com/karpathy/char-rnn

sudo apt-get install libreadline-dev luarocks -y

cd /opt
sudo git clone https://github.com/torch/distro.git torch --recursive
cd torch
sudo bash install-deps
sudo ./install.sh 


echo "============================================"
echo "Finished installing Torch"
echo "============================================"
