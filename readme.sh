#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 2.05.2022


# EXAMPLE
# ./readme.sh

# TODO: github actions to merge the all files in the fly
# CONFIG
LOGS="readme.logs.txt"
PROJECTS=readme.txt
PROJECT_LIST=$(cat $PROJECTS)

# START
echo "`date +"%T.%3N"` START" > $LOGS
echo "$(date +"%T.%3N") CREATE_MENU" >> $LOGS
#
DOMAIN=$(cat CNAME)
echo "+ [$DOMAIN](http://$DOMAIN)" > DOCS/PROJECTS.md
#
for FILE in */in.md; do
  line=$(head -n 1 $FILE)
  #echo "$FILE $line"
  #echo PROTOCOL=${URL%%://*}
  NAME=${FILE%%/*}
  URL=$DOMAIN/$NAME
  echo "+ [$NAME $line](http://$URL)" >> DOCS/PROJECTS.md
done

## combine from another sites
echo "$(date +"%T.%3N") COMBINE_FILES" >> $LOGS

echo "" >README.md
for project in $PROJECT_LIST; do
  echo "$(date +"%T.%3N") COMBINE_FILE $project" >> $LOGS
  cat $project >>README.md
  echo "" >>README.md
done
# Send to github
#git commit -m "Combine and update docs"
#git push
#firefox https://github.com/bashfunc/www
#open https://www.bashfunc.com/

echo "`date +"%T.%3N"` STOP" >> $LOGS
cat $LOGS