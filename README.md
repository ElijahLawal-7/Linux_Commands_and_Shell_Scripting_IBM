# Linux-Commands-and-Shell-Scripting-Final-Project_IBM-Data-Engineering-Professional-Certificate

This is a project on linux commands and shell scripting as part of IBM Data Enginnering Professional Certificate. 

The scenario of the project is below:

You are a lead linux developer at the top-tech company "ABC International INC." ABC currently suffers from a huge bottleneck - each day, interns must painstakingly access encrypted password files on core servers, and backup those that were updated within the last 24-hours. This introduces human error, lowers security, and takes an unreasonable amount of work. As ABC INC's most trusted linux developer, you have been tasked with creating a script `backup.sh` which automatically backs up any of these files that have been updated within the past 24 hours.

After the `backup.sh` script is created, the following codes are run in the terminal.

*#To make the script executable*
- chmod u+x backup.sh   

*#Verification that the file is executable*
- ls -l backup.sh       

*#This is a zip file to be downloaded*
- wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-LX0117EN-SkillsNetwork/labs/Final%20Project/important-documents.zip	  	

*#Unzip the archive file*
- unzip -DDo important-documents.zip	    

*#Update the file's last modified date to now*
- touch important-documents/*		      

*#Test the script to create a file called `backup-[CURRENT_TIMESTAMP].tar.gz` in the current directory*
- ./backup.sh important-documents .	  

*#Copy `backup.sh` into the /usr/local/bin/ directory*
- sudo cp backup.sh /usr/local/bin/	    

*#Open crontab editor*
- crontab -e	    

*#Schedule the `/usr/local/bin/backup.sh` script to backup the important-documents folder every 24 hours to the home directory (~)*
- 0 0 * * * /usr/bin/backup.sh ~/important-documents ~	      

*#List all cron jobs*
- crontab -l	    
