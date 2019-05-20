rm test.azr
rm current_work.azr
echo "which spin_parity are you testing?
	a)0+
	b)1-
	c)2+
	d)3-
	e)4+
	f)5-"
read which
ELLEa='2'
ELLEb='4'

if [ "${which}" = "a" ] ; then
	SPIN=0 
        PARITY=1 

elif [  "${which}" = "b" ] ; then
	SPIN=1 
        PARITY=-1
        LINES=3
	ESSE1=2
	ESSE2=2
	ESSE3=6
elif [ "${which}" = "c" ] ; then
	SPIN=2 
        PARITY=1
        LINES=4
	ESSE1=4
	ESSE2=0
	ESSE3=4
	ESSE4=8
elif [ "${which}" = "d" ] ; then
	SPIN=3
        PARITY=-1
        LINES=4
	ESSE1=6
	ESSE2=2
	ESSE3=6
	ESSE4=10
elif [ "${which}" = "e" ] ; then
	SPIN=4
        PARITY=1
        LINES=4
	ESSE1=8
	ESSE2=4
	ESSE3=8
	ESSE4=12
elif [ "${which}" = "f" ] ; then
	SPIN=5
        PARITY=-1
        LINES=4
	ESSE1=10
	ESSE2=6
	ESSE3=10
	ESSE4=14
fi


PARTIAL=(35000 3500 350)
PARTIAL=(3)
PARTIAL=(15000 10000 5000)
PARTIAL=(1500 1000 500)
PARTIAL=(150 100 50)
PARTIAL=(15000 10000 5000 5000)
PARTIAL=(1500 1000 500 500)
PARTIAL=(150 100 50 50)


# loop here X4#
echo " Which starting energy resonance are you testing?
1) 6950
2) 7041
3) 7176
4) 7370
5) 7480
6) 7801
7) 8026
8) 8189
9) 8322
10) 8507
11) 8586
12) 8672
13) 8717
14) 8924
"
read which_2

if [ "${which_2}" = "1" ] ; then
	RESON=(6.950 7.041 7.176 7.370)
elif [ "${which_2}" = "2" ] ; then
	RESON=(7.041 7.176 7.370 7.480)
elif [ "${which_2}" = "3" ] ; then
	RESON=(7.176 7.370 7.480 7.801)
elif [ "${which_2}" = "4" ] ; then
	RESON=(7.370 7.480 7.801 8.026)
elif [ "${which_2}" = "5" ] ; then
	RESON=(7.480 7.801 8.026 8.189)
elif [ "${which_2}" = "6" ] ; then
	RESON=(7.801 8.026 8.189 8.322)
elif [ "${which_2}" = "7" ] ; then
	RESON=(8.026 8.189 8.322 8.507)
elif [ "${which_2}" = "8" ] ; then
	RESON=(8.189 8.322 8.507 8.586)
elif [ "${which_2}" = "9" ] ; then
	RES=(8.322 8.507 8.586 8.672)
elif [ "${which_2}" = "10" ] ; then
	RES='8507'
	RES2=
	RES3=
	RES4=
elif [ "${which_2}" = "11" ] ; then
	RES='8586'
	RES2=
	RES3=
	RES4=
elif [ "${which_2}" = "12" ] ; then
	RES=1'8672'
	RES2=
	RES3=
	RES4=
elif [ "${which_2}" = "13" ] ; then
	RES1='8717'
	RES2=
	RES3=
	RES4=
elif [ "${which_2}" = "14" ] ; then
	RES='8924'
	RES2=
	RES3=
	RES4=
fi



#copy template
cp ./work ./current_work.azr
#for((a=1; a<=4; a++))
#do
INPUT="current_work.azr"
for ((j=0; j<4; j++))
	do
	
	echo $LINES
	echo $j
	echo ${RESON[${j}]}
	ENTRY=$j
	
	for ((c=1; c<=$LINES; c++))
		do

		LEVEL="spin    parity       res   fixe       1       1       2elle       2ess       entry      1       0       partial   0.5     1       1.5     1       0       1       37      1       19      4.547   4.547   0       0       0.0     0       6.06511 0       0       0"

		#sed -i "s/#level_info/${LEVEL}/ ; ta ; b ; :a ; N ; ba" ${INPUT}
		sed -i "0,/#level_info/s/#level_info/${LEVEL}/" ${INPUT}
		sed -i "s/res/${RESON[${j}]}/1" ${INPUT}
		sed -i "s/spin/$SPIN/1" ${INPUT}
		sed -i "s/parity/$PARITY/1" ${INPUT}
		sed -i "s/partial/${PARTIAL[${c}]}/1" ${INPUT}
		#sed -i "s/2elle"
		#sed -i "s/fixe/$FIXE" ${INPUT}

	done
	sed -i "s/entry/$j/g" ${INPUT}
done
echo "what do you want to call this run? "

read outfile
cp current_work.azr ${outfile}.azr




