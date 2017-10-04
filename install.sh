#!/bin/bash
echo "*************************************************"
echo "Creating wine prefix and performing winetricks."
echo "*************************************************"

WINEDEBUG=-all WINEPREFIX=/home/$USER/Warframe winetricks -q vcrun2015 devenum quartz xact xinput win7

echo "*************************************************"
echo "Creating warframe directories."
echo "*************************************************"
mkdir -p /home/$USER/Warframe/drive_c/Program\ Files/Warframe/
mkdir -p /home/$USER/Warframe/drive_c/users/$USER/Local\ Settings/Application\ Data/Warframe

echo "*************************************************"
echo "Copying warframe files."
echo "*************************************************"
cp -R * /home/$USER/Warframe/drive_c/Program\ Files/Warframe/ 

cd /home/$USER/Warframe/drive_c/Program\ Files/Warframe/
chmod a+x wget.exe
mv EE.cfg /home/$USER/Warframe/drive_c/users/$USER/Local\ Settings/Application\ Data/Warframe/EE.cfg

echo "*************************************************"
echo "Applying warframe wine prefix registry settings."
echo "*************************************************"
WINEDEBUG=-all WINEPREFIX=/home/$USER/Warframe wine regedit /S wf.reg

echo "*************************************************"
echo "Creating warframe shell script"
echo "*************************************************"

echo "#!/bin/bash" > warframe.sh

echo "export __GL_THREADED_OPTIMIZATIONS=1" >> warframe.sh
echo "export mesa_glthread=true" >> warframe.sh
echo "export PULSE_LATENCY_MSEC=60" >> warframe.sh
echo "cd /home/$USER/Warframe/drive_c/Program\ Files/Warframe/" >> warframe.sh
echo "WINEPREFIX=/home/$USER/Warframe WINEDEBUG=-all wine cmd /C Warframe-Launcher.bat" >> warframe.sh

chmod a+x warframe.sh

echo "*************************************************"
echo "The next few steps will prompt you for shortcut creations. If root is required, please enter your root password when asked."
echo "*************************************************"

echo "*************************************************"
echo "Creating warframe global terminal script."
echo "*************************************************"
sudo cp /home/$USER/Warframe/drive_c/Program\ Files/Warframe/warframe.sh /usr/bin/warframe


read -p "Would you like a menu shortcut? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

	echo "*************************************************"
	echo "Creating warframe application menu shortcut."
	echo "*************************************************"

	sudo cp warframe.png /usr/share/pixmaps/

	echo "[Desktop Entry]" > warframe.desktop
	echo "Encoding=UTF-8" >> warframe.desktop
	echo "Name=Warframe" >> warframe.desktop
	echo "GenericName=Warframe" >> warframe.desktop
	echo "Warframe" >> warframe.desktop
	echo "Exec=/usr/bin/warframe \"\$@\"" >> warframe.desktop
	echo "Icon=/usr/share/pixmaps/warframe.png" >> warframe.desktop
	echo "StartupNotify=true" >> warframe.desktop
	echo "Terminal=false" >> warframe.desktop
	echo "Type=Application" >> warframe.desktop
	echo "Categories=Application;Game" >> warframe.desktop

	sudo cp warframe.desktop /usr/share/applications/
fi

read -p "Would you like a desktop shortcut? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "*************************************************"
	echo "Creating warframe desktop shortcut. Please enter root password to allow /usr/share/applications entry to be created."
	echo "*************************************************"
	cp /usr/share/applications/warframe.desktop /home/$USER/Desktop/
fi


echo "*************************************************"
echo "Installation complete! It is safe to delete this folder."
echo "*************************************************"
