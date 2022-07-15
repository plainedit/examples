#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 11.05.2022


# EXAMPLE
# ./readme.sh

# TODO: github actions to merge the all files in the fly
# CONFIG
CMD=$1
[ -z "$CMD" ] && CMD="install"
#
MODULE="flatedit"
FILE_EXT=".txt"
CONFIG_FILE=".${MODULE}"
CONFIG_DEFAULT="${MODULE}${FILE_EXT}"
CONFIG_DEV="${MODULE}.dev${FILE_EXT}"
CONFIG_TEST="${MODULE}.test${FILE_EXT}"
LOGS=".${MODULE}.logs${FILE_EXT}"
#
if [ "$CMD" == "-h" ] || [ "$CMD" == "--help" ]; then
  echo "set config for:"
  echo "init - the default config, for customers"
  echo "dev - development packages, for contributors and developers"
  echo "test - for testing the project"
  echo ""
  exit
fi
if [ "$CMD" == "init" ]; then
  echo -n "${CONFIG_DEFAULT}" > "${CONFIG_FILE}"
  echo "${LOGS}" >> ".gitignore"
  [ ! -f "${CONFIG_DEFAULT}" ] && echo -n "" > "${CONFIG_DEFAULT}"
  PROJECT_LIST=$(cat ${CONFIG_DEFAULT})
  #echo "${PROJECT_LIST}"
  #[ ! -f "${PROJECT_LIST}" ] && echo -n "" > "${PROJECT_LIST}"
  exit
fi
#
if [ "$CMD" == "dev" ]; then
  echo -n "$CONFIG_DEV" > "$CONFIG_FILE"
  exit
fi
if [ "$CMD" == "test" ]; then
  echo -n "$CONFIG_TEST" > "$CONFIG_FILE"
  exit
fi
#
PROJECT_LIST=$(cat $CONFIG_DEFAULT)
[ ! -f "${PROJECT_LIST}" ] && echo -n "" > "${PROJECT_LIST}"
#
DSL_HASH="#"
LOCAL_PATH=$(pwd)
SUBFOLDER="DOCS"
MENU_URL="$SUBFOLDER/PROJECTS.md"
MENU_PATH="$SUBFOLDER/PROJECTS_LOCAL.md"
OUTPUT="README.md"

# START
echo "`date +"%T.%3N"` START" > $LOGS
echo "$(date +"%T.%3N") CREATE_MENU" >> $LOGS
#
DOMAIN=$(cat CNAME)
echo "+ [$DOMAIN](http://$DOMAIN)" > $MENU_URL
echo "+ [$LOCAL_PATH](file://$LOCAL_PATH/)" > $MENU_PATH
#
for FILE in */in.md; do
  line=$(head -n 1 $FILE)
  NAME=${FILE%%/*}
  URL=$DOMAIN/$NAME
  echo "+ [$NAME $line](http://$URL)" >> $MENU_URL
  echo "+ [$NAME $line](file://$LOCAL_PATH/$NAME/index.html)" >> $MENU_PATH
done

## combine from another sites
echo "$(date +"%T.%3N") COMBINE_FILES" >> $LOGS

echo "" > $OUTPUT
for project in $PROJECT_LIST; do
  # Remove Comments
  [ "${project:0:1}" == "${DSL_HASH}" ] && continue
  echo "$(date +"%T.%3N") COMBINE_FILE $project" >> $LOGS
  cat $project >> $OUTPUT
  echo "" >> $OUTPUT
done

echo "`date +"%T.%3N"` STOP" >> $LOGS
cat $LOGS