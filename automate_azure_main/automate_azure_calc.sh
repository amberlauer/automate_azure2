#!/bin/bash

#g++ -o automate_azure.o automate_azure.cpp
rm *outputs.txt
cwd=$(pwd)
cd /home/amber/executables/root-6.12.06/install
source ./bin/thisroot.sh
cd $cwd
echo "what to name the output file?"
read output_name
touch  ${output_name}_calc_outputs.txt
res=4
echo    "jpi1 jp2 jpi3 jpi4 res order" >> ${output_name}_calc_outputs.txt
for((a=0; a<=4; a++))
do 
        for((b=0; b<=4; b++))
        do
                for((c=0;c<=4; c++))
                do
                        for((d=0; d<=4; d++))
                        do
                                rm current_work.azr
                                ./automate_azure_calc.o $d $c $b $a  $res
                                mv work_temp.azr current_work.azr
                                echo "$d   $c    $b    $a  $res " >> ${output_name}_calc_outputs.txt
                                ./automate_azure_responses_calc.exp | grep -E 'Segment #1|WARNING' >> ${output_name}_calc_outputs.txt
                        done
                done
        done

        #done
done

#WARNING: Denominator less than zero in E=6.95 MeV resonance transformation.  Tranformation may not have been successful.


#cat $MESA_BASE/inlist_cluster >./inlist_cluster
#jpi=${i}p good_sets.txt)
# ./automate_azure.o $jpi 0e