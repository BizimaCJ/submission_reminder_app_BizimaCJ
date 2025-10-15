#!/bin/bash

echo "Starting the Reminder App..."

#move to the dir with this script + error haandling just in case
cd "$(dirname "$0")" || { echo "Failed to change directory"; exit 1; }

#run the app
./app/reminder.sh
