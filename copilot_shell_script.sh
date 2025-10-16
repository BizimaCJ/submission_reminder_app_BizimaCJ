#!/bin/bash

#error handling just in case there are many directories of the format submission_reminder_* and the current user is unaware of that fact
printf "To check for the non-submission status of another assignment, \n----------------------------------------\n"
echo "List of available environments: "
ls -d submission_reminder_*

read -p "Enter the name of the owner of the environment you want to use: " yourName


#now for the config.env file to change the  name of the assignment
#declaring viriables to hold the actual path of a file always makes work easier
config_env_path="./submission_reminder_$yourName/config/config.env"

#error handling. Just in case the name was written was written wrongly
if [ ! -f "$config_env_path" ]; then
	echo "Config file for $yourName wasn't found. Check if you wrote your name correctly."
	exit 1
fi

#for changing the assignment we are looking for
echo
echo "List of assignments: "
printf "Shell Navigation	Shell Basics	Git\n\nEnter the other assignment's name: "
read other_assignment

#using sed to change the assignment we're checking
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$other_assignment\"/g" "$config_env_path"

#running the startup.sh script so aas to start the reminder app
echo "Reminder for the $other_assignment assignment for $yourName"
./submission_reminder_$yourName/startup.sh
