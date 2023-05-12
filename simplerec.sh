#!/bin/bash

# Install git if it's not already installed
if ! command -v git &> /dev/null; then
    sudo pacman -S git
fi

# Clone the Simple Screen Recorder repository from GitHub
git clone https://aur.archlinux.org/simplescreenrecorder.git

# Install gcc if it's not already installed
if ! command -v gcc &> /dev/null; then
    sudo pacman -S gcc
fi

# Set the environment variables for the C and C++ compilers
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

# Navigate to the Simple Screen Recorder directory
cd simplescreenrecorder

# Build and install the package using makepkg
makepkg -si
