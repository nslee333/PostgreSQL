#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=nslee333 --dbname=worldcup -t --no-align -c"
fi

echo $($PSQL "TRUNCATE games, teams RESTART IDENTITY")

# Insert winner into teams
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
      # Insert opponent into teams
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
      # Insert game into games
    if [[ $YEAR != year ]]
    then
        INSERT_WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        INSERT_OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'") 
        INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$INSERT_WINNER_ID', '$INSERT_OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
        if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
        then
          echo "Inserted game into games"
        fi
    fi
  done