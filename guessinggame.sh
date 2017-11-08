#!/bin/bash

# The following script is a little guess game. You have to guess the number
# of the files from the current directory. You will be prompted to tell the
# number of files until you provide the correct answer.

# Avoid script to be exited by capturing SIGINT
trap '' SIGINT

guessed=false

# Get the number of the files
files_in_directory=$(ls -1 | wc -l)

function check_answer {
    regular_expression='^[0-9]+$'
    # Check if provided answer is a number
    if ! [[ $1 =~ $regular_expression ]] ; then
        echo "Error! You haven't typed a number, please try again!"
    elif [ $1 -lt $files_in_directory ] ; then
        echo "Number too low! Try again!"
    elif [ $1 -gt $files_in_directory ] ; then
        echo "Number too big! Try again!"
    else
       echo "You found the correct answer! The program will now exit..."
       guessed=true
    fi
}

while [ "$guessed" = false ]
do
    read -p "Hello $USER! How many files are in the current directory? " answer
    check_answer $answer
done