 #!/bin/bash
 #use this script as dbbackup.sh username databasename
source $HOME/.profile
pg_dump -F c -v -U $1 -h localhost $2 -f databases/gemini_backup$(date --date="today" +"%Y%m%d").psql