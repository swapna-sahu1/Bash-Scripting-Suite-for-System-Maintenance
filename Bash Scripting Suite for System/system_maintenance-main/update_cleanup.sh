#!/bin/bash

echo "Updating System..."
sudo apt update && sudo apt upgrade -y

echo "Cleaning unused packages..."
sudo apt autoremove -y
sudo apt autoclean -y

echo "System Updated and Cleaned Successfully!"

