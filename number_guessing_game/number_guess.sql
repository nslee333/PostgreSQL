CREATE TABLE players(user_id SERIAL PRIMARY KEY NOT NULL, user_name VARCHAR(50) NOT NULL, games_played INT, best_guess INT);

-- INSERT INTO players(user_name, games_played, best_guess) VALUES('Nathan', 3, 10), ('Efren', 10, 10), ('Allison', 5, 23);