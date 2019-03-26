#!/data/data/com.termux/files/usr/bin/bash
echo Script made by:- Dark Warrior
#Uninstall
if [ -e "user.cfg" ]
then
	uname=$(sed '1q;d' user.cfg)
	istate=$(sed '2q;d' user.cfg)
	if [ "$istate" -eq "1" ]
	then
		read -p "Uninstall? [Y/N]: " ink1
		case $ink1 in
			[yY][eE][sS]|[yY])
		rm user.cfg;
		echo $uname > user.cfg
		echo 0 >> user.cfg
		cd
		cd /$HOME
		cd ..
		cd usr/etc
		echo "command_not_found_handle() {
        	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
		} 
		PS1='\$ '" > bash.bashrc
		echo "Welcome to Termux!
		Wiki:            https://wiki.termux.com
		Community forum: https://termux.com/community
		IRC channel:     #termux on freenode
		Gitter chat:     https://gitter.im/termux/termux
		Mailing list:    termux+subscribe@groups.io

		Search packages:   pkg search <query>
		Install a package: pkg install <package>
		Upgrade packages:  pkg upgrade
		Learn more:        pkg help" > motd
		cd
		cd /$HOME
		figlet FemurTech
		echo Now Your Termux is back to Original
		echo "Uninstalled Succesfully"
		return
		;;
			*)
		;;
		esac
	fi
fi
#Assigns Username
if [ ! -e "user.cfg" ] 
then
	read -p "Type your username: " uname </dev/tty
	echo "This is your username: $uname"
	echo "$uname" > user.cfg
	echo "1" >> user.cfg
#Rename Username
else
	rm user.cfg
	echo "$uname" > user.cfg
	echo "1" >> user.cfg
	read -p "Would You Like to Change Your Username[Y/N]: " ink
	case "$ink" in
		[yY][eE][sS]|[yY])
	rm user.cfg;
	clear
	sh setup.sh;
	;;
	*)
	echo "Welcome back $uname"
	;;
	esac
fi
cd
cd /$HOME
#update packages
apt update
apt upgrade
apt install figlet toilet
pkg install ncurses-utils
apt-get install git
mkdir -p $PREFIX/var/lib/postgresql
cd ../usr/etc
rm motd
#Set default username if found null
if [ -z "$uname" ]
then
	uname="FemurTech"
fi
#Sets bash.bashrc aka startup
echo "command_not_found_handle() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found "'$1'"
}
shell() { 
	sh \$1.sh;bash \$1.bash;
 }
cds() { 
	if [[ \$* == *\"-i\"* ]]
	then
		var=\"\$*\"
		sub=\"\"
		qry=\$( echo \$var | sed 's/-i//g' )
		qry=\$( echo \$qry | sed 's/ //g' )
		echo finding \\\"\$qry\\\"
		cd \"\$( find \"\$(pwd)/\" -maxdepth 3 -not \\( -path \"/sdcard/Android/*\" -prune \\) -type d -iname \"\$qry\" -print -quit )\"
	else
		echo finding \$1
		cd \"\$( find \"\$(pwd)/\" -maxdepth 3 -not \\( -path \"/sdcard/Android/*\" -prune \\) -type d -name \"\$1\" -print -quit )\"
	fi
}
cdp() { 
	if [[ \$* == *\"-i\"* ]]
	then
		var=\"\$*\"
		sub=\"\"
		qry=\$( echo \$var | sed 's/-i//g' )
		qry=\$( echo \$qry | sed 's/ //g' )
		echo finding \\\"\$qry\\\"
		cd \"\$( find \"\$(pwd)/\" -maxdepth 3 -not \\( -path \"/sdcard/Android/*\" -prune \\) -type d -iname \"\$qry\"* -print -quit )\"
	else
		echo finding \$1
		cd \"\$( find \"\$(pwd)/\" -maxdepth 3 -not \\( -path \"/sdcard/Android/*\" -prune \\) -type d -name \"\$1\"* -print -quit )\"
	fi
}
updatedw() {
	cd \$HOME
	if [ -d \"\$HOME/termuxstyling\" ]
	then
		cd termuxstyling
		var=\$(git pull)
		git pull --rebase && prm sh
		echo \$var
		if [[ \$var == *\"Already\"* ]];
		then 
			clear && echo \"Already running the latest version!!\" && echo ------------------------------------- && figlet \$(sed '1q;d' 'ver.cfg')
		else
			shell setup;
			clear && echo \"Update Success\" && echo -------------- && figlet Success && figlet \$(sed '1q;d' 'ver.cfg')
		fi
	else
		git clone https://github.com/darkwarrior3/termuxstyling.git
		prm sh
		clear
		bash
		shell setup
		wait
		clear && echo \"Update Success\" && echo -------------- && figlet Success && figlet \$(sed '1q;d' 'ver.cfg')
	fi
}
prm() { chmod 777 *.\$1; }
txt() { cat \$1.*; }
figlet $uname
PS1='\033[1;91mroot@termux[\033[1;93m\W\033[1;91m]:
# \033[1;92m'
cd
alias md=\"mkdir\"
alias msf=\"msfconsole\"
alias msfdb=\"initdb $PREFIX/var/lib/postgresql && pg_ctl -D $PREFIX/var/lib/postgresql start \"
alias clear=\"clear;bash\"
alias dir=\"ls\"
alias ins=\"pkg install\"
alias ains=\"apt install\"
alias cls=\"clear\"
alias update=\"apt-get update && apt-get upgrade\"
if [ -e \".bash_aliases\" ];then sh ~/../usr/etc/.bash_aliases;fi" > bash.bashrc
cd /$HOME
cd termuxstyling
cat README.md
toilet Dark
toilet Warrior
echo Script made by Dark Warrior
echo Subscribe to our YT channel FemurTech
echo tinyurl.com/femurtech
echo Restart to apply changes
