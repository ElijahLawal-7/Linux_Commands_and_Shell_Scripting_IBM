# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
# Assign argument 1 and argument 2 to variables
targetDirectory=$1 
destinationDirectory=$2

# [TASK 2]
# Display the values of the two command line arguments
echo "Target directory: $targetDirectory"
echo "Backup destination: $destinationDirectory"

# [TASK 3]
# Define a variable called currentTS as the current timestamp, expressed in seconds
currentTS=$(date +%s)

# [TASK 4]
# Define a variable called backupFileName to store the name of the archived and compressed backup file that the script will create
backupFileName="backup-$currentTS.tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
# Define a variable called origAbsPath with the absolute path of the current directory as the variable's value
origAbsPath=$(pwd)

# [TASK 6]
# Define a variable called destAbsPath with value equal to the absolute path of the destination directory
cd $destinationDirectory
destAbsPath=$(pwd)

# [TASK 7]
# Change directories from the current working directory to the target directory targetDirectory
cd $origAbsPath 
cd $targetDirectory

# [TASK 8]
# Define a numerical variable called yesterdayTS as the timestamp (in seconds) 24 hours prior to the current timestamp, currentTS
yesterdayTS=$(($currentTS - 24 * 60 * 60))

declare -a toBackup

# For loop to return all files and directories in the current folder, check whether the $file was modified within the last 24 hours,
# and add the $file that was updated in the past 24-hours to the toBackup array
for file in $(ls) # [TASK 9]
do 
  # [TASK 10]
  if ((`date -r $file +%s` > $yesterdayTS))
  then
    # [TASK 11]
    toBackup+=($file)
  fi
done

# [TASK 12]
# Compress and archive the files, using the $toBackup array of filenames, to a file with the name backupFileName
tar -czvf $backupFileName ${toBackup[@]}

# [TASK 13]
# Move the file backupFileName to the destination directory located at destAbsPath
mv $backupFileName $destAbsPath

# Congratulations! You completed the final project for this course!
