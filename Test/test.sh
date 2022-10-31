#!/bin/bash

PSQL="psql --username=nslee333 --dbname=number_guess --no-align -t -c"


VAR=1;

((VAR++))
((VAR++))
((VAR++))
((VAR++))

echo $VAR 