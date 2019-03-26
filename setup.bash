#!/data/data/com.termux/files/usr/bin/bash
# Setting up commands
spinner(){
	stty -echo
	PID=$!
	tput civis
	echo -n "Installing "
	# While process is running...
	while kill -0 $PID 2> /dev/null;
	do  
		printf '\u2588'
    	sleep 0.1
	done
	printf " Done!\n"
	tput cnorm
	stty echo
}
echo Script made by:- Dark Warrior
#Uninstall
if [ -e ".user.cfg" ]
then
	uname=$(sed '1q;d' .user.cfg)
	istate=$(sed '2q;d' .user.cfg)
	if [ "$istate" -eq "1" ]
	then
		read -p "Uninstall? [Y/N]: " ink1
		case $ink1 in
			[yY][eE][sS]|[yY])
		rm .user.cfg;
		echo $uname > .user.cfg
		echo 0 >> .user.cfg
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
if [ ! -e ".user.cfg" ] 
then
	read -p "Type your username: " uname </dev/tty
	echo "This is your username: $uname"
	echo "$uname" > .user.cfg
	echo "1" >> .user.cfg
#Rename Username
else
	rm .user.cfg
	echo "$uname" > .user.cfg
	echo "1" >> .user.cfg
	read -p "Would You Like to Change Your Username[Y/N]: " ink
	case "$ink" in
		[yY][eE][sS]|[yY])
	rm .user.cfg;
	clear
	bash setup.bash;
	;;
	*)
	echo "Welcome back $uname"
	;;
	esac
fi
cd
cd ../usr/etc
#update packages
apt-get update > /dev/null 2>&1 & apt-get upgrade -y > /dev/null 2>&1 & apt-get autoremove > /dev/null 2>&1 & apt-get autoclean > /dev/null 2>&1 & apt install figlet toilet -y > /dev/null 2>&1 & pkg install ncurses-utils -y > /dev/null 2>&1 & apt-get install git -y > /dev/null 2>&1 & mkdir -p $PREFIX/var/lib/postgresql > /dev/null 2>&1 & cd ../usr/etc > /dev/null 2>&1 & rm motd > /dev/null 2>&1 & sleep 2 & spinner
#Set default username if found null
if [ -z "$uname" ]
then
	uname="FemurTech"
fi
#Sets bash.bashrc aka startup
cd /$HOME
cd ..
cd usr/etc
rm motd
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
		# echo \$var
		if [[ \$var == *\"Already\"* ]];
		then 
			clear && echo \"Already running the latest version!!\" && echo ------------------------------------- && figlet \$(sed '1q;d' 'ver.cfg') && figlet femurtech
		else
			git fetch --all
			git reset --hard origin/master
			shell setup;
			clear && echo \"Update Success\" && echo -------------- && figlet Success && figlet \$(sed '1q;d' 'ver.cfg') && figlet femurtech
		fi
	else
		git clone https://github.com/darkwarrior3/termuxstyling.git
		cd termuxstyling
		prm sh
		clear
		bash
		shell setup
		wait
		echo \"Update Success\" && echo -------------- && figlet Success && figlet \$(sed '1q;d' '/data/data/com.termux/files/home/termuxstyling/ver.cfg') && figlet femurtech
	fi
}
prm() { chmod +x *.\$1; }
txt() { cat \$1.*; }
figlet $uname
PS1='\033[1;91mroot@termux[\033[1;93m\W\033[1;91m]:
# \033[1;92m'
if grep -q '# 011' \"/data/data/com.termux/files/home/termuxstyling/.user.cfg\"
then
	lnum=\$( sed '2q;d' \"/data/data/com.termux/files/home/termuxstyling/.user.cfg\" )
	lnum=\$( echo \$lnum | sed 's/# 011//g' )
	lnum=\$( echo \$lnum | sed 's/ //g' )
	# echo \$( sed '2q;d' \"/data/data/com.termux/files/home/termuxstyling/.user.cfg\" )
		if [[ ! \$lnum -eq 25 ]]
		then
			lnum=\$((\$lnum+1))
			sed -i \"/.*# 011.*/ c\\ \$lnum # 011\" \"/data/data/com.termux/files/home/termuxstyling/.user.cfg\"
		else
			lnum=1
			sed -i \"/.*# 011.*/ c\\ \$lnum # 011\" \"/data/data/com.termux/files/home/termuxstyling/.user.cfg\"
			cd \$HOME
			cd termuxstyling
			vtest=\$(git pull)
			if [[ ! \$vtest == *\"Already\"* ]];
			then
				updatedw
			fi
		fi
		
	else
		# echo hi
		echo \"1 # 011\" >> \"/data/data/com.termux/files/home/termuxstyling/.user.cfg\"
	fi
cd
alias md=\"mkdir\"
alias msf=\"msfconsole\"
alias msfdb=\"initdb \$PREFIX/var/lib/postgresql;pg_ctl -D \$PREFIX/var/lib/postgresql start \"
alias clear=\"clear;bash\"
alias dir=\"ls\"
alias ins=\"pkg install\"
alias ains=\"apt install\"
alias cls=\"clear\"
alias rf=\"rm -rf\"
alias gic=\"git clone\"
alias fuck=\"figlet FUCK;figlet OFF\"
alias upg=\"git reset --hard;git pull\"
alias update=\"apt-get update;apt-get upgrade\"" > bash.bashrc
cd /$HOME
cd termuxstyling
cat README.md
toilet Dark
toilet Warrior
echo Script made by Dark Warrior
echo Subscribe to our YT channel FemurTech
echo tinyurl.com/femurtech
echo Restart to apply changes
cd
