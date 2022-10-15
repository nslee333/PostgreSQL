#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=nslee333 --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# if [[ $1 == "test" ]]
# then
#   PSQL="psql -U nslee333 --dbname=worldcuptest -t -A -c"
# else
#   PSQL="psql -U postgres -d worldcup -t -A -c"
# fi




# Insert data into teams 
# 24 rows

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
  do
    if [[ $WINNER != winner ]]
    then
      WINNER_ID=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
      if [[ -z $WINNER_ID ]]
      then
        INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
        then
          echo "Inserted $WINNER into teams"
        fi
      fi
    fi

      if [[ $OPPONENT != opponent ]]
      then
        OPPONENT_ID=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
        if [[ -z $OPPONENT_ID ]]
        then
          INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

          if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
          then
            echo "Inserted $OPPONENT into teams"
          fi
        fi
      fi
  done

















# Insert data into games
# 32 rows.
