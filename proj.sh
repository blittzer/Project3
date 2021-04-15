#!/bin/sh

list() {
	local DIR="~"
	OUT="filetree.html"
	local tabs=$3
	local t=$(expr $tabs + 2)
	{
	echo "<ul>"
	} >> $OUT
	for files in $DIR/*; do
		if [ -d $files ]; then
			dir="${files##*/}"
			{
			echo "<h3>$dir</h3>"
			} >> $OUT
			list $files $OUT $t
		else
			if [ -r $files ]; then
				fil="${files##*/}"
				{
				echo "<LI><a href=$files>$fil</a></br>"
				} >> $OUT
			fi
		fi
	done
	{
	echo "</ul>"
	} >> $OUT
}
STARTDIR="~"
OUTPUT="filetree.html"
TAB=0
stdir="${STARTDIR##*/}"
{
echo "<html>"
echo "<head>"
echo "<title>"
echo "ECE3524 Project 3 Benjamin Blitt"
echo "</head>"
echo "</html>"
echo "</title>"
echo "<h3>"
echo "$stdir"
echo "</h3>"
} >> $OUTPUT
list $STARTDIR $OUTPUT $TAB