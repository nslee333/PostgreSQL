#!/bin/bash

PSQL="psql --username=nslee333 --dbname=salon -t -c"

RE='[1-100000000000000000]' # non digit
 
GUESS='1' # non digit

if [[ ! $GUESS =~ $RE ]]
then
    echo "Sucess"
fi