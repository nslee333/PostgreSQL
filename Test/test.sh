#!/bin/bash

PSQL="psql --username=nslee333 --dbname=number_guess --no-align -t -c"

BEST_GAME=0

NUM_GUESSES=5

USER_NAME='Nathan'


if [[ $NUM_GUESSES < $BEST_GAME || $BEST_GAME == 0 ]]
then
    echo "Success"
    $PSQL "UPDATE players SET best_guess = $NUM_GUESSES WHERE user_name = '$USER_NAME'"
fi