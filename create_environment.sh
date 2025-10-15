#!/bin/bash

echo "----------------------------------------"
echo "Starting the Submission Reminder App..."
echo "----------------------------------------"

#code for asking the name to use on the directory
read -p "What's your name?
--> " yourName

#code to create the main directory
parent_dir="submission_reminder_$yourName"

#code for error handling if the parent_dir already exists
if [ -d "$parent_dir" ]; then
	echo "Directory "$parent_dir" already exists. You'll have to either delete it first or choose another name."
	exit 1
fi

#Now, to create all the needed directories
mkdir -p "$parent_dir"
mkdir -p "$parent_dir/app"
mkdir -p "$parent_dir/modules"
mkdir -p "$parent_dir/assets"
mkdir -p "$parent_dir/config"

#creation of the files in the sub-directories and startup.sh
touch $parent_dir/app/reminder.sh
touch $parent_dir/assets/submissions.txt
touch $parent_dir/modules/functions.sh
touch $parent_dir/config/config.env
touch $parent_dir/startup.sh

#writing to the reminder.sh
cat << 'EOF' > $parent_dir/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

#writing to the functions.sh file
cat << 'EOF' > $parent_dir/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

#writing to the submissions.txt file
cat << 'EOF' > $parent_dir/assets/submissions.txt
echo "student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Bella, Shell Navigation, not submitted
Carmel, Git, submitted
Menankiti, Shell Basics, submitted
Honnette, Shell Navigation, not submitted
Jessica, Shell Navigation, not submitted
Rosette, Shell Basics, submitted
Denise, Git, submitted
Oluebubechi, Git, submitted
EOF

#writing to the config.env file
#cat writes better than echo for text with "" that's why I used it.
cat << 'EOF' > $parent_dir/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

#writing to the startup.sh file
cat << 'EOF' > $parent_dir/startup.sh
#!/bin/bash

echo "Starting the Reminder App..."

#move to the dir with this script + error haandling just in case
cd "$(dirname "$0")" || { echo "Failed to change directory"; exit 1; }

#run the app
./app/reminder.sh
EOF

printf "\nThe director and its contents have been created.\n----------------------------------------\n"

#Now, to make all these files executable
find "$parent_dir" -type f -name "*.sh" -exec chmod +x {} \;

printf "All is good for $yourName's environment!!! (^o^)/\n\nTo start the app, run:\ncd $parent_dir && ./startup.sh\n----------------------------------------\n"
