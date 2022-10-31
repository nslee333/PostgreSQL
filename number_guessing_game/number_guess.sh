#!/bin/bash

echo "Enter your username:"
read USER_NAME

PSQL="psql -X --username=nslee333 --dbname=number_guess --no-align -q -t -c"

NAME_QUERY=$($PSQL "SELECT user_name FROM players WHERE user_name = '$USER_NAME'")

if [[ $USER_NAME == "$NAME_QUERY" ]]
then
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE user_name = '$USER_NAME'")
    BEST_GAME=$($PSQL "SELECT best_guess FROM players WHERE user_name = '$USER_NAME'")

    echo "Welcome back, $USER_NAME! You have played '$GAMES_PLAYED' games, and your best game took '$BEST_GAME' guesses."

    ((GAMES_PLAYED++))
    $PSQL "UPDATE players SET games_played = $GAMES_PLAYED WHERE user_name = '$USER_NAME'"
else
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
    
    $PSQL "INSERT INTO players(user_name, games_played, best_guess) VALUES('$USER_NAME', 1, 50)"
fi

RAND_NUM=$(( RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"

NUM_GUESSES=0

while read USER_GUESS
do
    ((NUM_GUESSES++))
    REG_EX='^[0-9]{1,4}$'
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
    elif [[ $USER_GUESS == "$RAND_NUM" ]]
    then 
    echo "You guessed it in $NUM_GUESSES tries. The secret number was $RAND_NUM. Nice job!"
        if [[ $NUM_GUESSES < $BEST_GAME ]]
        then
            $PSQL "UPDATE players SET best_guess = $NUM_GUESSES WHERE user_name = '$USER_NAME'"
        fi
        break
    fi
done
