Bash script that will enter info into world cup database.

Query the database for useful statistics.

1. 

Create database

Insert the data

Query the database.



REQUIREMENTS:
    TABLES = teams, games
    teams
        team_id SERIAL PRIMARY KEY NOT NULL;
        name UNIQUE NOT NULL;
    games
        game_id SERIAL PRIMARY KEY NOT NULL
        year INT NOT NULL;
        round VARCHAR NOT NULL;
        winner_id ADD FOREIGN KEY REFERENCES team_id NOT NULL;
        opponent_id ADD FOREIGN KEY REFERENCES team_id NOT NULL;
        winner_goals INT NOT NULL;
        opponent_goals INT NOT NULL;

insert_data.sh
queries.sh

    chmod +x ./insert_data.sh
    chmod +x ./queries.sh

insert_data.sh
    INSERT each team to TEAMS
        SHOULD BE 24 rows.
    Add row per game 
        32 rows

queries.sh
    Complete each query.
    Fill in each empty echo command with the query.
    Only use a single line.
    Output should match the expected_results.txt file.


