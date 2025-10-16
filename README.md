This is the README.md file of this repository.

This repository contains the work from the individual summative assessment of the Introduction to Linux & IT Tools course. The duty was to build an application that alerts students about upcoming assignment deadlines. 

The summative was divided into 3 tasks: 
-Task 1: Create the Setup Script
-Task 2: Create the Copilot Script
-Task 3: Git Branching Workflow

1. For task 1:
The setup script created was create_environment.sh
This script's purpose was to create a directory structure for whichever name was entered as input. This is how the directory structure is supposed to look:

submission_reminder_$yourName/

-|-- app
_|_____ reminder.sh

-|-- modules
_|_____ functions.sh

-|-- assets
_|_____ submissions.txt

-|-- config
_|_____ config.env

-|-- startup.sh

The files' contents in each of the sub-directories were provided to us to copy in the create_environment.sh file. The file startup.sh was not provided though. It was supposed to contain the logic that makes the reminder.sh run.

To run create_environment.sh, type ./create_environment.sh in the terminal.
This will create the directory structure with all the necessary files. After having this, the next step will be to run the startup.sh file so as to view who haven't submitted the Shell Navigation assignment yet.
To run startup.sh, change into the new directory (cd submissions_reminder_$yourName) and type ./startup.sh in the terminal.
Note: There are many ways to make a script run, the one above isn't the only one that can work.

2. For task 2:
The duty was to create a copilot_shell_script.sh that will allow us to view non-submission status of different courses by changing what is written in the ASSIGNMENT line in the config/config.env file. The last line in that script reruns the startup.sh script so as to see the reminders for those who haven't submitted yet. 

3. For task 3:
Two branches had to be present: the main branch and the feature branch for all the rough drafts. They had to be merged  before submission with only 3 files present: create_environment.sh, copilot_shell_script.sh, and README.md

No directory were requested to be part of this submission. In fact, they were prohibited and only those three files had to be present.
