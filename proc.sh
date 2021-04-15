#! /bin/bash

proc_menu() {
	echo "----------------------------------"
	echo "Process Operations"
	echo "----------------------------------"
	echo "1. Show all processes"
	echo "2. Kill a process"
	echo "3. Bring up top"
	echo "4. return to main menu"
	proc_choose
}

enter_func() {
	echo "Press [Enter] key to continue: "
	read key 
	if [ "$key" = "" ]; then 
		proc_menu
	else
		echo "ERROR: ENTER NOT PRESSED"
		enter_func
	fi
}


proc_choose() {
	echo "enter a digit [1-4]"
	read choice
	if [ "$choice" = "1" ]; then
		all
	elif [ "$choice" = "2" ]; then
		kill_proc
	elif [ "$choice" = "3" ]; then
		bring_top
	elif [ "$choice" = "4" ]; then
		echo "Returning to main menu"
	else
		echo "Error invalid digit"
		proc_choose
	fi
}

all() {
	list=$(ps aux)
	echo "$list"
	enter_func
}

kill_proc() {
	echo "Please enter the PID of the process you would like to kill:"
	read PID
	kill -SIGKILL $PID
	enter_func
}

bring_top() {
	top
	proc_menu
}

proc_menu