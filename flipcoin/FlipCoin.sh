#!/bin/bash -x

echo "Flip coin simulation"

#DICTIONARY DECLARATION
declare -A singletDictionary
declare -A doubletDictionary
declare -A tripletDictionary

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
HeadHH=0
HeadHT=0
HeadTH=0
HeadTT=0
TailHH=0
TailHT=0
TailTH=0
TailTT=0
tripletDictionary[HHH]=0
tripletDictionary[HHT]=0
tripletDictionary[HTH]=0
tripletDictionary[HTT]=0
tripletDictionary[THH]=0
tripletDictionary[THT]=0
tripletDictionary[TTH]=0
tripletDictionary[TTT]=0

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


#PERCENTAGE OF TRIPLET COMBINATION
for (( index=1; index<=$end; index++ ))
do
   randomCheck1=$((RANDOM%2))
   randomCheck2=$((RANDOM%2))
	randomCheck3=$((RANDOM%2))
   if (( $randomCheck1 == $H && $randomCheck2 == $H && $randomCheck3 == $H ))
   then
      HeadHH=$(($HeadHH+1))
      tripletDictionary[HHH]=$HeadHH
   elif (( $randomCheck1 == $H && $randomCheck2 == $H && $randomCheck3 == $T ))
   then
      HeadHT=$(($HeadHT+1))
      tripletDictionary[HHT]=$HeadHT
   elif (( $randomCheck1 == $H && $randomCheck2 == $T && $randomCheck3 == $H ))
   then
      HeadTH=$(($HeadTH+1))
      tripletDictionary[HTH]=$HeadTH
   elif (( $randomCheck1 == $H && $randomCheck2 == $T && $randomCheck3 == $T ))
	then
      HeadTT=$(($HeadTT+1))
      tripletDictionary[HTT]=$HeadTT
	elif (( $randomCheck1 == $T && $randomCheck2 == $H && $randomCheck3 == $H ))
   then
      TailHH=$(($TailHH+1))
      tripletDictionary[THH]=$TailHH
   elif (( $randomCheck1 == $T && $randomCheck2 == $H && $randomCheck3 == $T ))
   then
      TailHT=$(($TailHT+1))
      tripletDictionary[THT]=$TailHT
   elif (( $randomCheck1 == $T && $randomCheck2 == $T && $randomCheck3 == $H ))
   then
      TailTH=$(($TailTH+1))
      tripletDictionary[TTH]=$TailTH
   else
      TailTT=$(($TailTT+1))
      tripletDictionary[TTT]=$TailTT
   fi
done

for i in "${!tripletDictionary[@]}"
do
   echo "$i---->${tripletDictionary[$i]}"
done

HeadHHAvg=`echo "scale = 3 ; (${tripletDictionary[HHH]}*100)/$end" | bc -l` 
echo "Percentage of HHH is : $HeadHHAvg"
HeadHTAvg=`echo "scale = 3 ; (${tripletDictionary[HHT]}*100)/$end" | bc -l` 
echo "Percentage of HHT is : $HeadHTAvg"
HeadTHAvg=`echo "scale = 3 ; (${tripletDictionary[HTH]}*100)/$end" | bc -l` 
echo "Percentage of HTH is : $HeadTHAvg"
HeadTTAvg=`echo "scale = 3 ; (${tripletDictionary[HTT]}*100)/$end" | bc -l` 
echo "Percentage of HTT is : $HeadTTAvg"
TailHHAvg=`echo "scale = 3 ; (${tripletDictionary[THH]}*100)/$end" | bc -l` 
echo "Percentage of THH is : $TailHHAvg"
TailHTAvg=`echo "scale = 3 ; (${tripletDictionary[THT]}*100)/$end" | bc -l` 
echo "Percentage of THT is : $TailHTAvg"
TailTHAvg=`echo "scale = 3 ; (${tripletDictionary[TTH]}*100)/$end" | bc -l` 
echo "Percentage of TTH is : $TailTHAvg"
TailTTAvg=`echo "scale = 3 ; (${tripletDictionary[TTT]}*100)/$end" | bc -l` 
echo "Percentage of TTT is : $TailTTAvg"

