#!/bin/bash

#error handling just in case
echo "List of available environments: "
ls -d submission_reminder_*

read -p "Enter the name of the owner of the environment you want to use: " yourName


#now for the config file to change the  name of the assignment
config_file="./submission_reminder_$yourName/config/config.env"

#error handling, again
if [ ! -f "$config_file" ]; then
	echo "Config file for $yourName wasn't found. Check if you wrote your name correctly."
	exit 1
fi

#for changing the assignment we are looking for
echo "List of assignments: "
printf "Shell Navigation\nShell Basics\nGit\n\nEnter the other assignment's name: "
read new_assignment

#using sed to change the assignment we're checking
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/g" "$config_file"

echo "Reminder for the $new_assignment assignment for $yourName"
./submission_reminder_$yourName/startup.sh
