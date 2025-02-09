# PSQL="psql -X --username=postgres --dbname=worldcup --no-align --tuples-only -c"

# echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

# cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPENENTGOALS
# do
#   if [[ $YEAR != year ]]
#     then
#     # get major_id
#     TEAM_ID=$($PSQL "SELECT game_id FROM games WHERE game=''")

#     # if not found
#     if [[ -z $MAJOR_ID ]]
#       then
#       # insert major
#       INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")

#       if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
#         then
#         echo Inserted into majors, $MAJOR
#       fi
#       # get new major_id
#       MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
#     fi
#   # insert major
#   # get new major_id
#   # get course_id
#   COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
#   echo $COURSE_ID
#   # if not found
#   if [[ -z $COURSE_ID ]]
#     then
#     # insert course
#     INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
#     if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
#       then
#       echo Inserted into courses, $COURSE
#     fi
#     # get new course_id
#     COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
#   fi
#   # insert into majors_courses
#    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
#   fi
# done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPENENTGOALS
do
  echo $WINNER $OPPONENT 
  # if [[ $FIRST != first_name ]]
  #   then
  #   #get major_id
  #   MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
  #   #if not found
  #   if [[ -z $MAJOR_ID ]]
  #     then
  #     #set to null
  #     MAJOR_ID=null
  #   fi
  #   #insert student
  #   INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)")

  #   if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
  #     then
  #     echo Inserted into students, $FIRST $LAST
  #   fi
  # fi
done