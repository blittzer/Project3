#!/bin/bash
main() {
	DATE=$(date)
	echo "$DATE"
	echo "----------------------------------"
	echo "Main Menu"
	echo "----------------------------------"
	echo "1. Operating system info"
	echo "2. Hostname and DNS info"
	echo "3. Network info"
	echo "4. Who is online"
	echo "5. Last logged in users"
	echo "6. My IP address"
	echo "7. My disk usage"
	echo "8. My home file-tree"
	echo "9. Process operations"
	echo "10. Exit"
	choice_func
}

choice_func() {
	echo "Enter a integer [1-10]: "
	read choice
	if [ "$choice" = "1" ]; then
		os_info
	elif [ "$choice" = "2" ]; then #needs to be done still
		host_info
	elif [ "$choice" = "3" ]; then
		net_info
	elif [ "$choice" = "4" ]; then
		who_is
	elif [ "$choice" = "5" ]; then
		last_log
	elif [ "$choice" = "6" ]; then
		ip_info
	elif [ "$choice" = "7" ]; then
		usage
	elif [ "$choice" = "8" ]; then
		echo "Printing tree tp treefile.html"
		/bin/bash ./proj.sh
		enter_func
	elif [ "$choice" = "9" ]; then
		proc
	elif [ "$choice" = "10" ]; then
		echo "Exiting"
	else
		echo "Error: Incorred digit"
		choice_func
	fi
}

enter_func() {
	echo "Press [Enter] key to continue: "
	read key 
	if [ "$key" = "" ]; then 
		main
	else
		echo "ERROR: ENTER NOT PRESSED"
		enter_func
	fi
}

os_info() {
	echo "----------------------------------"
	echo "System Informatiom"
	echo "----------------------------------"
	echo "Operating System : Linux"
	info=$(/usr/bin/lsb_release -a)
	echo "$info"
	enter_func
}

host_info() {
	echo "----------------------------------"
	echo "Hostname and DNS Informatiom"
	echo "----------------------------------"
	Host=$(hostname)
	echo "Hostname : $Host"
	enter_func
}

net_info() {
	echo "----------------------------------"
	echo "Network Informatiom"
	echo "----------------------------------"
	num=$(ls -A /sys/class/net | wc -l)
	echo "Total number of network interfaces found: $num"
	echo "*** IP Address Informatiom ***"
	inter=$(ip link)
	echo "$inter"
	echo "******************************"
	echo "*** Network Routing ***"
	echo "******************************"
	net=$(netstat -rn)
	echo "$net"
	neti=$(netstat -i)
	echo "******************************"
	echo "*** Interface Traffic Info ***"
	echo "******************************"
	echo "$neti"
	enter_func
}

who_is() {
	echo "----------------------------------"
	echo "Who is online"
	echo "----------------------------------"
	info=$(who -H)
	echo "$info"
	enter_func
}


last_log() {
	echo "----------------------------------"
	echo "Last Logged in Users"
	echo "----------------------------------"
	last_five=$(last -n 5)
	echo "$last_five"
	enter_func
}

ip_info() {
	echo "----------------------------------"
	echo "Public IP Information"
	echo "----------------------------------"
	namey=$(dig @resolver4.opendns.com myip.opendns.com +short)
	echo "$namey"
	enter_func
}

usage() {
	echo "----------------------------------"
	echo "Disk Usage Info"
	echo "----------------------------------"
	usage=$(df | awk '{printf("%d",$5)}{printf(" %s\n",$6)}')
	echo "$usage"
	enter_func
}

proc() {
	/bin/bash ./proc.sh
}

main