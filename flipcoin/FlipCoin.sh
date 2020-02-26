#!/bin/bash -x

echo "Flip coin simulation"

#DICTIONARY DECLARATION
declare -A singletDictionary
declare -A doubletDictionary

#VARIABLES
H=0
T=1
head=0
tail=0
singletDictionary[H]=0
singletDictionary[T]=0
doubleHead=0
doubleTail=0
headTail=0
tailHead=0
doubletDictionary[HH]=0
doubletDictionary[HT]=0
doubletDictionary[TH]=0
doubletDictionary[TT]=0

read -p "Enter how many times you want to flip the coin : " end

#PERCENTAGE OF SINGLET COMBINATION
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

for i in ${!singletDictionary[@]}
do
	echo "$i---->${singletDictionary[$i]}"
done

headAvg=`echo "scale = 3 ; (${singletDictionary[H]}*100)/$end" | bc -l` 
tailAvg=`echo "scale = 3 ; (${singletDictionary[T]}*100)/$end" | bc -l` 
echo "Percentage of head : $headAvg"
echo "Percentage of tail : $tailAvg"

#PERCENTAGE OF DOUBLET COMBINATION
for (( index=1; index<=$end; index++ ))
do
   randomCheck1=$((RANDOM%2))
   randomCheck2=$((RANDOM%2))
   if (( $randomCheck1 == $H && $randomCheck2 == $H ))
   then
      doubleHead=$(($doubleHead+1))
      doubletDictionary[HH]=$doubleHead
   elif (( $randomCheck1 == $H && $randomCheck2 == $T ))
   then
		headTail=$(($headTail+1))
		doubletDictionary[HT]=$headTail
	elif (( $randomCheck1 == $T && $randomCheck2 == $H ))
	then
		tailHead=$(($tailHead+1))
		doubletDictionary[TH]=$tailHead
	else
		doubleTail=$(($doubleTail+1))
		doubletDictionary[TT]=$doubleTail
	fi
done

for i in ${!doubletDictionary[@]}
do
	echo "$i---->${doubletDictionary[$i]}"
done

doubleHeadAvg=`echo "scale = 3 ; (${doubletDictionary[HH]}*100)/$end" | bc -l` 
echo "Percentage of HH is : $doubleHeadAvg"
headTailAvg=`echo "scale = 3 ; (${doubletDictionary[HT]}*100)/$end" | bc -l` 
echo "Percentage of HT is : $headTailAvg"
tailHeadAvg=`echo "scale = 3 ; (${doubletDictionary[TH]}*100)/$end" | bc -l` 
echo "Percentage of TH is : $tailHeadAvg"
doubleTailAvg=`echo "scale = 3 ; (${doubletDictionary[TT]}*100)/$end" | bc -l` 
echo "Percentage of TT is : $doubleTailAvg"

