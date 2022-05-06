#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 2.05.2022

# EXAMPLE
# ./readme.sh

# TODO: github actions to merge the all files in the fly
# CONFIG
PROJECTS=readme.txt
PROJECT_LIST=$(cat $PROJECTS)

# START
## combine from another sites
echo "" > README.md
for project in $PROJECT_LIST
do
  cat $project >> README.md
  echo "" >> README.md
done
# Send to github
#git commit -m "Combine and update docs"
#git push