#!/bin/bash

SYM_REGEX='^[A-Z]{1}[a-z]{0,1}$'

PSQL="psql --username=nslee333 --dbname=periodic_table -t -c"

NAME_QUERY=$($PSQL "SELECT name FROM elements WHERE name='$1'");

TRIMMED=${NAME_QUERY/ /}

if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."

elif [[ $1 =~ [0-9] ]] 
then
    QUERY_RESULTS=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number = $1")

    if [[ -n $QUERY_RESULTS ]]
    then
            echo $QUERY_RESULTS | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR METAL_TYPE
            do
                echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $METAL_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
            done
    else
        echo "I could not find that element in the database."

    fi

elif [[ $1 =~ $SYM_REGEX ]] # Trying to get this to work.
then
    QUERY_RESULTS=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol = '$1'")

    if [[ -n $QUERY_RESULTS ]]
    then
            echo $QUERY_RESULTS | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR METAL_TYPE
            do
                echo "The element the atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $METAL_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
            done
    else
        echo "I could not find that element in the database."

    fi

elif [[ "$1" == "$TRIMMED" ]]
then
    QUERY_RESULTS=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name = '$1'")

    if [[ -n $QUERY_RESULTS ]]
    then
            echo $QUERY_RESULTS | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR METAL_TYPE
            do
                echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $METAL_TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
            done
    else
        echo "I could not find that element in the database."
    fi
else
    echo "The argument provided was not correct: please enter an atomic number, symbol or name of the element you wish to know about."
fi

echo "'$1' '$TRIMMED'"
