#!/usr/bin/bash

#the official sublimer logo
# SUBLIMER_LOGO = 
# "          _     _ _                     
#  ___ _   _| |__ | (_)_ __ ___   ___ _ __ 
# / __| | | | '_ \| | | '_ ` _ \ / _ \ '__|
# \__ \ |_| | |_) | | | | | | | |  __/ |   
# |___/\__,_|_.__/|_|_|_| |_| |_|\___|_| 
# "

#this is the sublime.desktop's source code
LAUNCHER_TEXT = 
"
[Desktop Entry]
Version=1.0
Name=Sublime Text 2
# Only KDE 4 seems to use GenericName, so we reuse the KDE strings.
# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413.
GenericName=Text Editor

Exec=sublime
Terminal=false
Icon=/opt/Sublime Text 2/Icon/48x48/sublime_text.png
Type=Application
Categories=TextEditor;IDE;Development
X-Ayatana-Desktop-Shortcuts=NewWindow

[NewWindow Shortcut Group]
Name=New Window
Exec=sublime -n
TargetEnvironment=Unity
"

#read filename from answer
read -p "Enter the filename of zip file: " filename

#unzip the zip file
tar xf "$filename"

#move the folder to opt folder
sudo mv Sublime\ Text\ 2 /opt/

#create symlink of sublime_text app
sudo ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/bin/sublime

#create sublime.desktop for our launcher in Unity
sudo sublime /usr/share/applications/defaults.list

#and edit it
sudo echo "$LAUNCHER_TEXT" >> /usr/share/applications/sublime.desktop

#open defaults.list file
sudo sublime /usr/share/applications/defaults.list

#replace all gedit.desktops with sublime.desktop
sudo sed -i 's/gedit.desktop/sublime.desktop/g' /usr/share/applications/defaults.list

#finally, tell about success
echo 'Sublime Text 2 successfully installed on your PC!'
