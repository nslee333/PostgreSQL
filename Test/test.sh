#!/bin/bash

PSQL="psql --username=nslee333 --dbname=number_guess -t -c"

NAME_QUERY=$($PSQL "SELECT user_name FROM players WHERE user_name = 'Nathan'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE user_name = 'Nathan'")
BEST_GAME=$($PSQL "SELECT best_guess FROM players WHERE user_name = 'Nathan'")

echo "'$NAME_QUERY'"
echo "'$GAMES_PLAYED'"
echo "'$BEST_GAME'"



GAMES_TRIM=${GAMES_PLAYED/ /}
BEST_TRIM=${BEST_GAME/ /}
NAME_TRIM=${NAME_QUERY/ /}

echo "'$GAMES_TRIM'"
echo "'$BEST_TRIM'"
echo "'$NAME_TRIM'"