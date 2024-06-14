#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Install git if it's not already installed
if ! command_exists git; then
    echo "Git is not installed. Installing git..."
    sudo pacman -S git --noconfirm
else
    echo "Git is already installed."
fi

# Clone the Simple Screen Recorder repository from GitHub
if [ ! -d "simplescreenrecorder" ]; then
    echo "Cloning Simple Screen Recorder repository..."
    git clone https://aur.archlinux.org/simplescreenrecorder.git
else
    echo "Simple Screen Recorder repository already exists."
fi

# Install gcc if it's not already installed
if ! command_exists gcc; then
    echo "GCC is not installed. Installing gcc..."
    sudo pacman -S gcc --noconfirm
else
    echo "GCC is already installed."
fi

# Set the environment variables for the C and C++ compilers
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

# Navigate to the Simple Screen Recorder directory
cd simplescreenrecorder || { echo "Directory 'simplescreenrecorder' not found. Exiting."; exit 1; }

# Build and install the package using makepkg
if makepkg -si; then
    echo "Simple Screen Recorder has been installed successfully."
else
    echo "Failed to build and install Simple Screen Recorder. Please check for errors."
    exit 1
fi
