#!/bin/bash

#g++ -o automate_azure_manual.o automate_azure_manual.cpp
rm *outputs.txt
cwd=$(pwd)
#cd /home/amber/executables/root_6.16.00/install
cd /home/amber/executables/root-6.12.06/install
source ./bin/thisroot.sh
cd $cwd
echo "what to name the output folder"
read prefix
rm current_work.azr
g++ -o automate_azure_manual2.o automate_azure_manual2.cpp
rm -r /home/amber/Documents/Tech/azure/outputs/manual/${prefix}
mkdir /home/amber/Documents/Tech/azure/outputs/manual/${prefix}


for((a=1; a<=30; a++))
do
        
        fit=$(sed -n "${a}"'p' ./final_fit_res8)
        input=${fit}\ ${prefix}
        ./automate_azure_manual2.o ${input}
        mv work_temp2.azr current_work2.azr
        echo "\n The tested values are ${input}" >> terminal_out2.txt
        ./automate_azure_manual2.exp >> terminal_out2.txt
        cwd=$(pwd)
        cd /home/amber/Documents/Tech/azure/outputs/manual/${prefix}
        mv AZUREOut_aa=1_R=1.out  "${fit}"AZUREOut_aa=1_R=1.out
        mv chiSquared.out         "${fit}"chiSquared.out
        mv param.par              "${fit}"param.par
        mv parameters.out         "${fit}"parameters.out
        rm ./current_work2.azr
cd $cwd

done
mv terminal_out2.txt     /home/amber/Documents/Tech/azure/outputs/manual/${prefix}

#WARNING: Denominator less than zero in E=6.95 MeV resonance transformation.  Tranformation may not have been successful.

#xn=$(sed -n ${SLURM_ARRAY_TASK_ID}p ~/sens/reaction_list_305.txt)
#cat $MESA_BASE/inlist_cluster >./inlist_cluster
#jpi=${i}p good_sets.txt)
# ./automate_azure.o $jpi 0e
