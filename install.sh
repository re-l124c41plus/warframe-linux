#!/bin/bash

# Change to your preferred installation directory
GAMEDIR="/home/${USER}/Games/Warframe"

echo "*************************************************"
echo "Creating wine prefix and performing winetricks."
echo "*************************************************"

WINEDEBUG=-all WINEARCH=win32 WINEPREFIX=$GAMEDIR winetricks -q vcrun2015 xact xinput win7

echo "*************************************************"
echo "Creating warframe directories."
echo "*************************************************"
mkdir -p ${GAMEDIR}/drive_c/Program\ Files/Warframe/
mkdir -p ${GAMEDIR}/drive_c/users/${USER}/Local\ Settings/Application\ Data/Warframe

echo "*************************************************"
echo "Copying warframe files."
echo "*************************************************"
cp -R * ${GAMEDIR}/drive_c/Program\ Files/Warframe/ 

cd ${GAMEDIR}/drive_c/Program\ Files/Warframe/
chmod 744 wget.exe
mv EE.cfg ${GAMEDIR}/drive_c/users/${USER}/Local\ Settings/Application\ Data/Warframe/EE.cfg

echo "*************************************************"
echo "Applying warframe wine prefix registry settings."
echo "*************************************************"
WINEDEBUG=-all WINEARCH=win32 WINEPREFIX=$GAMEDIR wine regedit /S wf.reg

echo "*************************************************"
echo "Creating warframe shell script"
echo "This script uses __GL_SHADER_DISK_CACHE=1 and __GL_SHADER_DISK_CACHE_PATH=${GAMEDIR}"
echo "If you are not installing the game on an SSD hard drive, please remove these two environment variables from/home/${USER}/bin/warframe.sh"
echo "*************************************************"

echo "#!/bin/bash" > warframe.sh

echo "export PULSE_LATENCY_MSEC=60" >> warframe.sh
echo "export __GL_THREADED_OPTIMIZATIONS=1" >> warframe.sh

echo "cd ${GAMEDIR}/drive_c/Program\ Files/Warframe/" >> warframe.sh
echo "WINEARCH=win32 WINEPREFIX=$GAMEDIR WINEDEBUG=-all wine cmd /C Warframe-Launcher.bat" >> warframe.sh

chmod 744 warframe.sh
mv warframe.sh /home/$USER/bin/warframe.sh

echo "*************************************************"
echo "Installation complete! It is safe to delete this folder."
echo "If you have Warframe data from a previous install"
echo "you can now copy it to the appropiate location before"
echo "launching Warframe, to save time downloading."
echo "The data should reside in:"
echo "${GAMEDIR}/$USER/Games/Warframe/drive_c/Program\ Files/Warframe/Downloaded"
echo "*************************************************"
