#!/bin/bash
echo "This script will copy your latest azure run files into a new folder and rename them?

	What folder?"
read action1
echo "Which resonance are you adjusting (in keV)?"
read action2

mkdir $action1
cp ./output/AZUREOut_aa=1_R=1.out ./$action1/AZUREOut_aa=1_R=1_$action2.out
cp ./output/chiSquared.out ./$action1/chiSquared_$action2.out
#cp ./output/normalizations.out ./$action1/normalizations_$action2.out
cp ./output/parameters.out ./$action1/parameters_$action2.out
cp ./output/param.par ./$action1/param_$action2.par
cp ./output/param.sav ./$action1/param_$action2.sav 

