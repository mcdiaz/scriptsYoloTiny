#!/bin/bash
cat $1 | tr " " _ > $2
for i in $(seq 0 $( tail $2 -n 1 | cut -d ";" -f 2 ) ); do
	for j in $( cat $2 | grep -E ';'$i';' | cut -d ";" -f 3,4,5,6,7,8,9,10 ); do
		touch $4/"frame_"$i".txt"
		u=$( echo $j | cut -d ";" -f 5,6 | tr " " "_" )
		v=$( echo $j | cut -d ";" -f 7,8 | tr " " "_" )
		w=$( echo $j | cut -d ";" -f 9,10 | tr " " "_" )
		if [ -n "$u" ]; then
			echo "$u;$j" | cut -d ";" -f 1,2,3,4,5,6 | tr ";" "\t" >> $4/"frame_"$i".txt"
		fi
		if [ -n "$v" ]; then
			echo "$v;$j" | cut -d ";" -f 1,2,3,4,5,6 | tr ";" "\t" >> $4/"frame_"$i".txt"
		fi
		if [ -n "$w" ]; then
			echo "$w;$j" | cut -d ";" -f 1,2,3,4,5,6 | tr ";" "\t" >> $4/"frame_"$i".txt"
		fi
	done
done
