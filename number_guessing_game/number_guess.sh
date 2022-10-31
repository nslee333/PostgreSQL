#!/bin/bash

echo "Enter your username:"
read USER_NAME

PSQL="psql --username=nslee333 --dbname=number_guess -t -c"

NAME_QUERY=$($PSQL "SELECT user_name FROM players WHERE user_name = '$USER_NAME'")

if [[ $USER_NAME == $NAME_QUERY ]]
then
    PLAYER_INFO=$($PSQL "SELECT games_played, best_guess FROM players WHERE user_name = $USER_NAME")
    echo "$PLAYER_INFO" | read GAMES_PLAYED BAR BEST_GAME
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

else
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
fi

RAND_NUM=$(( RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"
NUM_GUESSES=0
while read USER_GUESS
do
    ((NUM_GUESSES++))
    REG_EX='[0-1000000000000000000000]'
    if [[ ! $USER_GUESS =~ $REG_EX ]] # -> If not an INT, echo message
    then
        echo "That is not an integer, guess again:"
        continue
    elif [[ $USER_GUESS < $RAND_NUM ]]
    then 
        echo "It's higher than that, guess again:"
        continue
    elif [[ $USER_GUESS > $RAND_NUM ]]
    then
        echo "It's lower than that, guess again:"
        continue
    elif [[ $USER_GUESS == $RAND_NUM ]]
    then 
        if [[ $NUM_GUESSES < $BEST_GAME ]]
        then
            $($PSQL "UPDATE players SET best_guess = $NUM_GUESSES WHERE user_name = '$USER_NAME'")
        fi
        INCREMENT_GAMES_PLAYED=$(GAMES_PLAYED++)
        $($PSQL "UPDATE players SET games_played = $INCREMENT_GAMES_PLAYED WHERE user_name = '$USER_NAME'") 
        break
    fi
done
