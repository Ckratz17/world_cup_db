PSQL="psql -X --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

echo $($PSQL "TRUNCATE teams, games")
# Do not change code above this line. Use the PSQL variable above to query your database.
PSQL="psql -X --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
do
  # INSERT TEAMS INTO THE TEAM TABLE
  if [[ $WINNER != winner ]]
    then
    WINNER_NAME=$($PSQL "SELECT DISTINCT(name) FROM teams WHERE name='$WINNER'")
    OPPONENT_NAME=$($PSQL "SELECT DISTINCT(name) FROM teams WHERE name='$OPPONENT'")
    if [[ -z $WINNER_NAME ]]
      then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
        then
        echo Inserted into teams, $WINNER
      fi
    fi
    if [[ -z $OPPONENT_NAME ]]
      then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
        then
        echo Inserted into teams, $OPPONENT
      fi
    fi

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'") 
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE winner_id = $WINNER_ID AND opponent_id = $OPPONENT_ID")
    if [[ -z $GAME_ID ]]
     then
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNERGOALS, $OPPONENTGOALS)")
      if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
          then
          echo Inserted into games, $YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNERGOALS $OPPONENTGOALS
      fi
    fi
  fi
done 