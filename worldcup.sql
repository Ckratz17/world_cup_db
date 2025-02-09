-- Active: 1732063839454@@127.0.0.1@5432@books_db
DROP DATABASE IF EXISTS worldcup;
CREATE DATABASE worldcup;

\c worldcup;

CREATE TABLE teams(
    team_id SERIAL PRIMARY KEY, 
    name VARCHAR(50) UNIQUE
);

CREATE TABLE games(
    game_id SERIAL PRIMARY KEY, 
    year INT NOT NULL, 
    round VARCHAR(20) NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL,
    Foreign Key (winner_id) 
    REFERENCES teams(team_id),
    Foreign Key (opponent_id) 
    REFERENCES teams(team_id)
);