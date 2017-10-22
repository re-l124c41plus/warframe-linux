#!/bin/bash

# Change to your preferred installation directory
GAMEDIR="/home/${USER}/Warframe"

echo "*************************************************"
echo "The next few steps will remove all shortcuts and warframe files."
echo "If root is required, please enter your root password when prompted."
echo "*************************************************"

echo "*************************************************"
echo "Removing /usr/bin/warframe"
echo "*************************************************"
sudo rm -R /usr/bin/warframe

echo "*************************************************"
echo "Removing /usr/share/pixmaps/warframe.png"
echo "*************************************************"
sudo rm -R /usr/share/pixmaps/warframe.png

echo "*************************************************"
echo "Removing /usr/share/applications/warframe.desktop"
echo "*************************************************"
sudo rm -R /usr/share/applications/warframe.desktop 

echo "*************************************************"
echo "Removing sudo rm -R /home/$USER/Desktop/warframe.desktop"
echo "*************************************************"
sudo rm -R /home/$USER/Desktop/warframe.desktop

echo "*************************************************"
echo "Removing home/$USER/Warframe"
echo "*************************************************"
sudo rm -R $GAMEDIR

echo "*************************************************"
echo "Warframe has been successfully removed."
echo "*************************************************"
