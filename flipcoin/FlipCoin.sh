#!/bin/bash -x

echo "Flip coin simulation"

#FLIP COIN AND DISPLAY HEADS OR TAIL
randomCheck=$((RANDOM%2))
if (( randomCheck == 0 ))
then
	echo "HEADS"
else
	echo "TAILS"
fi
