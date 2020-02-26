#!/bin/bash -x

echo "Flip coin simulation"

#PERCENTAGE OF SINGLET COMBINATION
declare -A singletDictionary

#VARIABLES
H=0
T=1
head=0
tail=0
singletDictionary[H]=0
singletDictionary[T]=0
read -p "Enter how many times you want to flip the coin : " end
for (( index=1; index<=$end; index++ ))
do
	randomCheck=$((RANDOM%2))
	if (( $randomCheck == $H ))
	then
		head=$(($head+1))
		singletDictionary[H]=$head
	else
		tail=$(($tail+1))
		singletDictionary[T]=$tail
	fi
done
headAvg=`echo "scale = 3 ; (${singletDictionary[H]}*100)/$end" | bc -l` 
tailAvg=`echo "scale = 3 ; (${singletDictionary[T]}*100)/$end" | bc -l` 
echo "Percentage of head : $headAvg"
echo "Percentage of tail : $tailAvg"

