 #!/bin/bash
 #use this script as dbrestore.sh username databasename filenametorestre
 #if user error check /etc/postgresql/version#/main/pg_hba.conf and add line for user to md5 auth
source $HOME/.profile
pg_restore -C -c -F c -v -U $1 -d $2 $3