#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

echo "$($PSQL "

CREATE TABLE teams (
    team_id SERIAL NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE games (
    game_id SERIAL NOT NULL,
    year INTEGER NOT NULL,
    round VARCHAR(20) NOT NULL,
    winner_id      INTEGER NOT NULL,
    opponent_id    INTEGER NOT NULL,
    winner_goals   INTEGER NOT NULL,
    opponent_goals INTEGER NOT NULL
);

ALTER TABLE teams ADD PRIMARY KEY (team_id);
ALTER TABLE games ADD PRIMARY KEY (game_id);
ALTER TABLE games ADD FOREIGN KEY (winner_id)   REFERENCES teams (team_id);
ALTER TABLE games ADD FOREIGN KEY (opponent_id) REFERENCES teams (team_id);
")"


