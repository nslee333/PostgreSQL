#!/bin/bash

# Generate RAND_NUM

# Prompt for a username:
    # "Enter your username:"

# if [[ username in database ]]
# then
    # echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

# else
    # echo "Welcome, $USER_NAME! It looks like this is your first time here."

# echo "Guess the secret number between 1 and 1000:"
#  while read USER_GUESS
# do
    # if [[ ! USER_GUESS =~ [0-1000] ]]
    # then
        # echo "That is not an integer, guess again:"
        # continue
    # elif [[ USER_GUESS < RAND_NUM ]]
    # then 
        # echo "It's higher than that, guess again:"
        # continue
    # elif [[ $USER_GUESS > RAND_NUM ]]
    # then
        # "It's lower than that, guess again:"
        # continue
    # elif [[ $USER_GUESS == RAND_NUM ]]
    # then 
        # echo "You guessed it in $NUM_GUESSES tries. The secret number was $RAND_NUM. Nice job!"
        # break
    # fi
# done
