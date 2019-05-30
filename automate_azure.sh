#!/bin/bash

#g++ -o automate_azure.o automate_azure.cpp
echo "what do you want to do?

a)calc
b)fit"

read action1

if [ "${action1}" = "a" ] ; then
        bash ./automate_azure_fit/automate_azure_fit.sh

elif [ "${action1}" = "b" ] ; then
        bash ./automate_azure_calc/automate_azure_calc.sh
fi