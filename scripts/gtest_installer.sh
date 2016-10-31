#!/bin/bash

# Exit early if any of the commands fails
set -e

echo "============================================"
echo "Installing Googletest                       "
echo "============================================"

sudo apt-get install cmake
sudo wget https://github.com/google/googletest/archive/release-1.7.0.tar.gz
sudo tar release-1.7.0.tar.gz
sudo rm release-1.7.0.tar.gz
cd release-1.7.0
sudo cmake -DBUILD_SHARED_LIBS=ON .
sudo make -j8 
sudo cp -a include/gtest /usr/include
sudo cp -a libgtest_main.so libgtest.so /usr/lib/
#sudo ldconfig -v | grep gtest


echo "============================================"
echo "Finished installing Googletest              "
echo "============================================"
