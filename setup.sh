#!/data/data/com.termux/files/usr/bin/bash
echo Script made by:- Dark Warrior
if [ ! -e "DW.config" ]
then
	read -p "Type your username: " uname </dev/tty
	echo "This is your username: $uname"
	echo "$uname" > DW.config
else
	read -p "Would You Like to Change Your Username[Y/N]: " ink
	case "$ink" in
		[yY][eE][sS]|[yY])
	rm DW.config;
	clear && printf "\e[3J";
	sh setup.sh;
	;;
	*)
	uname=$(cat DW.config)
	echo "Welcome back $uname"
	;;
	esac
fi
cd
cd /$HOME
apt update
apt upgrade
apt install figlet toilet
pkg install ncurses-utils
pkg install cmatrix
cd ../usr/etc
rm motd
if [ -z $uname ]
then
	uname="FemurTech"
fi
echo "command_not_found_handle() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found "'$1'"
}
shell() { sh \$1.sh; }
txt() { cat \$1.*; }
figlet $uname
PS1='\033[1;91mroot@termux[\033[1;93m\W\033[1;91m]:#
\033[1;92m'
cd /sdcard
alias clear=\"clear;bash\"
alias dir=\"ls\"
alias ins=\"pkg install\"
alias ains=\"apt install\"
alias matrix=\"cmatrix\"
alias cls=\"clear\"" > bash.bashrc
cd /sdcard/documents/termuxstyling
cat README.md
toilet Dark
toilet Warrior
echo Script made by Dark Warrior
echo Subscribe to our YT channel FemurTech
echo tinyurl.com/femurtech
echo Restart to apply changes