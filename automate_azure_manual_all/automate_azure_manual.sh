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
g++ -o automate_azure_manual.o automate_azure_manual.cpp
rm -r /home/amber/Documents/Tech/azure/outputs/manual/${prefix}
mkdir /home/amber/Documents/Tech/azure/outputs/manual/${prefix}


for((a=1; a<=5; a++))
do

        fit1=$(sed -n "${a}"'p' ./final_fit_res0)

        for((b=1; b<=5; b++))
        do
                fit2=$(sed -n "${b}"'p' ./final_fit_res4)
                for((c=1; c<=5; c++))
                do
                        fit3=$(sed -n "${c}"'p' ./final_fit_res8)
                        input=${fit1}\ ${fit2}\ ${fit3}
                        ./automate_azure_manual.o ${input}
                        mv work_temp.azr current_work.azr
                        echo "\n The tested values are ${input}" >> terminal_out.txt
                        ./automate_azure_manual.exp >> terminal_out.txt
                        cwd=$(pwd)
                        cd /home/amber/Documents/Tech/azure/outputs/manual/${prefix}
                        mv AZUREOut_aa=1_R=1.out  "${input}"AZUREOut_aa=1_R=1.out
                        mv chiSquared.out         "${input}"chiSquared.out
                        mv param.par              "${input}"param.par
                        mv parameters.out         "${input}"parameters.out
                        rm ./current_work.azr
                        cd $cwd

                done
        done


done
mv terminal_out.txt     /home/amber/Documents/Tech/azure/outputs/manual/${prefix}

#WARNING: Denominator less than zero in E=6.95 MeV resonance transformation.  Tranformation may not have been successful.

#xn=$(sed -n ${SLURM_ARRAY_TASK_ID}p ~/sens/reaction_list_305.txt)
#cat $MESA_BASE/inlist_cluster >./inlist_cluster
#jpi=${i}p good_sets.txt)
# ./automate_azure.o $jpi 0e
