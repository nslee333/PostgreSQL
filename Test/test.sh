#!/bin/bash

PSQL="psql --username=nslee333 --dbname=salon -t -c"


SYM_REGEX='^[A-Z]{1}[a-z]{0,1}$'

if [[ $1 =~ $SYM_REGEX ]]
then
    echo "if"
else
    echo "Else"
fi