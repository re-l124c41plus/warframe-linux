#!/bin/bash
echo "*************************************************"
echo "Creating wine prefix and performing winetricks."
echo "*************************************************"

WINEDEBUG=-all WINEPREFIX=/home/$USER/Games/Warframe winetricks -q vcrun2015 devenum quartz xact xinput win7

echo "*************************************************"
echo "Creating warframe directories."
echo "*************************************************"
mkdir -p /home/$USER/Games/Warframe/drive_c/Program\ Files/Warframe/
mkdir -p /home/$USER/Games/Warframe/drive_c/users/$USER/Local\ Settings/Application\ Data/Warframe

echo "*************************************************"
echo "Copying warframe files."
echo "*************************************************"
cp -R * /home/$USER/Games/Warframe/drive_c/Program\ Files/Warframe/ 

cd /home/$USER/Games/Warframe/drive_c/Program\ Files/Warframe/
chmod 744 wget.exe
mv EE.cfg /home/$USER/Games/Warframe/drive_c/users/$USER/Local\ Settings/Application\ Data/Warframe/EE.cfg

echo "*************************************************"
echo "Applying warframe wine prefix registry settings."
echo "*************************************************"
WINEDEBUG=-all WINEPREFIX=/home/$USER/Games/Warframe wine regedit /S wf.reg

echo "*************************************************"
echo "Creating warframe shell script"
echo "*************************************************"

echo "#!/bin/bash" > warframe.sh

echo "export PULSE_LATENCY_MSEC=60" >> warframe.sh
echo "export __GL_THREADED_OPTIMIZATIONS=1" >> warframe.sh
echo "cd /home/$USER/Games/Warframe/drive_c/Program\ Files/Warframe/" >> warframe.sh
echo "WINEPREFIX=/home/$USER/Games/Warframe WINEDEBUG=-all wine cmd /C Warframe-Launcher.bat" >> warframe.sh

chmod 744 warframe.sh
mv warframe.sh /home/$USER/bin/warframe.sh

echo "*************************************************"
echo "Installation complete! It is safe to delete this folder."
echo "If you have Warframe data from a previous install"
echo "you can now copy it to the appropiate location before"
echo "launching Warframe, to save time downloading."
echo "The data should reside in:"
echo "/home/$USER/Games/Warframe/drive_c/Program\ Files/Warframe/Downloaded"
echo "*************************************************"
