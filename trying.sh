"which file are you starting from?

	a)0+
	b)1-
	c)2+
	d)3-
	e)4+
	f)5-"
read which

	if [ "${which}" = "a" ] ; then
		cp setup0+.azr current_work.azr
	elif[ "${which}" = "b" ] ; then
		cp setup1-.azr current_work.azr
	elif[ "${which}" = "c" ] ; then
		cp setup2+.azr current_work.azr
	elif[ "${which}" = "d" ] ; then
		cp setup3-.azr current_work.azr
	elif[ "${which}" = "e" ] ; then
		cp setup4+.azr current_work.azr
	elif[ "${which}" = "f" ] ; then
		cp setup5-.azr current_work.azr
	elif

for i in {1..3}
do
echo 
" Which energy resonance are you testing?
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
	res=6950
elif [ "${which_2}" = "2" ] ; then
	res=7041
elif [ "${which_2}" = "3" ] ; then
	res=7176
elif [ "${which_2}" = "4" ] ; then
	res=7370
elif [ "${which_2}" = "5" ] ; then
	res=7480
elif [ "${which_2}" = "6" ] ; then
	res=7801
elif [ "${which_2}" = "7" ] ; then
	res=8026
elif [ "${which_2}" = "8" ] ; then
	res=8189
elif [ "${which_2}" = "9" ] ; then
	res=8322
elif [ "${which_2}" = "10" ] ; then
	res=8507
elif [ "${which_2}" = "11" ] ; then
	res=8586
elif [ "${which_2}" = "12" ] ; then
	res=8672
elif [ "${which_2}" = "13" ] ; then
	res=8717
elif [ "${which_2}" = "14" ] ; then
	res=8924
fi

"what j-pi do you want

	a) 0+
	b) 1-
	c) 2+
	d) 3-
	e) 4+
	f) 5-
	
"
read which_3

copy this into   file

if [ "${which_3}" = "a" ] ; then


sed '/   2    1        7.041    1    1    1    2    4    6    1    0               15000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   2    1        7.041    1    1    1    4    0    6    1    0               10000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   2    1        7.041    1    1    1    4    4    6    1    0                5000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   2    1        7.041    1    1    1    4    8    6    1    0                5000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0/a 
"
   0    1          E_res    1    1    1    4    4    num   1    0               30000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
"
	elif [ "${which3}" = "b" ] ; then
"
   1   -1         E_res    1    1    1    2    2    num    1    0               20000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   1   -1         E_res    1    1    1    4    2    num    1    0               10000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   1   -1         E_res    1    1    1    4    6    num    1    0                5000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
"
	elif [ "${which3}" = "c" ] ; then
"
   2    1           E_res    1    1    1    2    4    num    1    0               15000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   2    1           E_res    1    1    1    4    0    num    1    0               10000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   2    1           E_res    1    1    1    4    4    num    1    0                5000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   2    1           E_res    1    1    1    4    8    num    1    0                5000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
"
	elif [ "${which3}" = "d" ] ; then

"
   3   -1        E_res    1    1    1    2    6    4    num    0               10000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   3   -1        E_res    1    1    1    4    2    4    num    0               15000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   3   -1        E_res    1    1    1    4    6    4    num    0                5000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   3   -1        E_res    1    1    1    4   10    4    num    0                5000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
"
	elif [ "${which3}" = "e" ] ; then
"
   4    1        E_res    1    1    1    2    8    5    num    0               10000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   4    1        E_res    1    1    1    4    4    5    num    0               20000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   4    1        E_res    1    1    1    4    8    5    num    0                5000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
"
	elif [ "${which3}" = "f" ] ; then
"
   5   -1           E_res    1    1    1    2   10    6    num    0               10000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   5   -1           E_res    1    1    1    4    6    6    num    0               20000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
   5   -1           E_res    1    1    1    4   10    6    num    0                5000  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0 6.06511            0            0       0
"
	fi
	
	
remove all lines with ${res}
replace E_res with ${res} and num with ${which2}


in current_work.azr



done

"what do you want to call this run? "

read outfile
mv current_work.azr ${outfile}.azr




