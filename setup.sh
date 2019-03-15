#!/data/data/com.termux/files/usr/bin/bash
echo Script made by:- Dark Warrior
cd
cd /$HOME
apt update
apt upgrade
apt install figlet toilet
cd ..
cd usr/etc
rm motd
echo "command_not_found_handle() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}
PS1='\033[1;91mroot@termux[\033[1;93m\W\033[1;91m]:#
\033[1;92m'
figlet FemurTech" > bash.bashrc
cd /$HOME
cd
cd termuxstyling
cat README.md
figlet Dark
figlet Warrior
echo Script made by Dark Warrior
echo subscribe our youtube channel FemurTech
echo tinyurl.com/femurtech
echo Restart to apply changes
