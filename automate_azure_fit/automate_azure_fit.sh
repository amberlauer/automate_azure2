#!/bin/bash

#g++ -o automate_azure.o automate_azure.cpp
rm *outputs.txt
cwd=$(pwd)
cd /home/amber/executables/root_6.16.00/install
source ./bin/thisroot.sh
cd $cwd
echo "what to name the output file?"
read output_name
output_root=/home/amber/Documents/Tech/azure
touch  ${output_name}_fit_outputs.txt

echo    "jpi1 jp2 jpi3 jpi4 res order" >> ${output_name}_fit_outputs.txt
for((a=1; a<=212; a++))
do
        rm ./current_work.azr
        fit=$(sed -n "$a"'p' ./good_calcs_res4)
        ./automate_azure_fit.o $fit
        mv work_temp.azr current_work.azr
        echo "$fit" >> ${output_name}_fit_outputs.txt
        ./automate_azure_fit.exp | grep -E 'Segment #1|WARNING' >> ${output_name}_fit_outputs.txt
done
mv ${output_name}_fit_outputs.txt ${output_root}/outputs/
#WARNING: Denominator less than zero in E=6.95 MeV resonance transformation.  Tranformation may not have been successful.

#xn=$(sed -n ${SLURM_ARRAY_TASK_ID}p ~/sens/reaction_list_305.txt)
#cat $MESA_BASE/inlist_cluster >./inlist_cluster
#jpi=${i}p good_sets.txt)
# ./automate_azure.o $jpi 0e