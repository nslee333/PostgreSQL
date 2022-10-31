#!/bin/bash

echo "Enter your username:"
read USER_NAME

PSQL="psql -X --username=nslee333 --dbname=number_guess -t -c"

NAME_QUERY=$($PSQL "SELECT user_name FROM players WHERE user_name = '$USER_NAME'")
TRIMMED=${NAME_QUERY/ /}

if [[ $USER_NAME == $TRIMMED ]]
then
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE user_name = '$USER_NAME'")
    BEST_GAME=$($PSQL "SELECT best_guess FROM players WHERE user_name = '$USER_NAME'")

    echo "'$GAMES_PLAYED'"
    echo "'$BEST_GAME'"

    GAMES_TRIM=${GAMES_PLAYED/ /}
    BEST_TRIM=${BEST_GAME/ /}

    echo "'$GAMES_TRIM'"
    echo "'$BEST_TRIM'"
    


    echo "Welcome back, $USER_NAME! You have played '$GAMES_PLAYED' games, and your best game took '$BEST_GAME' guesses."
    # Add to games_played count.

else
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
    INSERT_PLAYER=$($PSQL "INSERT INTO players(user_name, games_played, best_guess) VALUES('$USER_NAME', 1, 1)")
fi

RAND_NUM=$(( RANDOM % 1000 + 1 ))
echo $RAND_NUM

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
    elif [[ $USER_GUESS == $RAND_NUM ]]
    then 
        if [[ $NUM_GUESSES < $BEST_GAME ]]
        then
            $($PSQL "UPDATE players SET best_guess = $NUM_GUESSES WHERE user_name = '$USER_NAME'")
        fi
        INCREMENT_GAMES_PLAYED=$((GAMES_PLAYED++))
        echo $INCREMENT_GAMES_PLAYED
        $PSQL "UPDATE players SET games_played = $INCREMENT_GAMES_PLAYED WHERE user_name = '$USER_NAME'"
        break
    fi
done
