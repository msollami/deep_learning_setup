#!/bin/bash

# Exit early if any of the commands fails
set -e

echo "============================================"
echo "Installing keras" 
echo "============================================"
#reference http://npatta01.github.io/2015/08/10/dlib/

pip install --upgrade pip

sudo pip install keras

echo "============================================"
echo "Finished installing Keras." 
echo "============================================"