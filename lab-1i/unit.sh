#!/bin/bash

i=1;
res=0;
line=0;
while [ $i -le 40 ]; do
	# use yes to get the result from function
	# cut seperated by ' ' and get the 7 field 
	res=`yes $i | qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &`;
	res=`echo $res| cut -d ' ' -f 7`;

	# sed -n can gat the i line result
	line=$(sed -n "$i p" "fibans.text")

	# if not qual show the right answer
	if [ $line != $res ];
	then
		echo "wrong at $i the ans is $line function get $res";
	else
		echo "Correct at $i gets $line";
	fi
	# set i to environment variable to continue the while
	i=`expr $i + 1`;
done

