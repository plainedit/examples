#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 25.04.2022

# EXAMPLE
# ./plainedit.sh
# ./plainedit.sh 1
# ./plainedit.sh 2
# ./plainedit.sh "in.md" "out.md"
# ./plainedit.sh --path "/media/tom/projects/plainedit/examples/1" "in.md" "out.md"

# CONFIG
LOGS="logs.txt"
HTML_FOLDER="html"
HTML_FILE="index.html"
HTML_PATH="$HTML_FOLDER/$HTML_FILE"

# START
echo "$1 $2"
if [ "$1" != "" ]; then
    echo "FIRST_NOT_EMPTY" > $LOGS
    FIRST=$1
    SECOND=$2
    full_path=$(realpath $0)
    dirpath=$(dirname $full_path)
    #dirpath=$(pwd)

    ## load all params: in out status
    if [ "$1" = "--path" ]; then
      dirpath=$2
      FIRST=$3
      SECOND=$4
    fi

    HTML_PATH="$dirpath/$FIRST/$HTML_FILE"

    # HEAD
    cat "$dirpath/$HTML_FOLDER/head.html" > $HTML_PATH

    #TITLE=$(head -n 1 "$dirpath/$FIRST/in.md")
    #echo "<h2>$TITLE</h2>" >> $HTML_PATH
    #echo "<p>MENU</p>" >> $HTML_PATH
    pandoc -f markdown "$dirpath/DOCS/PROJECTS.md" >> $HTML_PATH
    echo "<hr>" >> $HTML_PATH

    # BODY
    if [ "$SECOND" = "" ]; then
        ./plainedit/plainedit.sh --path "$dirpath" $FIRST

        pandoc -f markdown "$dirpath/$FIRST/out.md" >> $HTML_PATH
    else
        ./plainedit/plainedit.sh --path $dirpath $FIRST $SECOND
        pandoc -f markdown "$dirpath/$SECOND" >> $HTML_PATH
    fi

    # FOOT
    echo "<hr>" >> $HTML_PATH
    echo "<h2>LOCAL MENU</h2>" >> $HTML_PATH
    pandoc -f markdown "$dirpath/DOCS/PROJECTS_LOCAL.md" >> $HTML_PATH
    cat "$dirpath/html/foot.html" >> $HTML_PATH

    firefox $HTML_PATH
else
    echo "FIRST_EMPTY" > $LOGS
    ./plainedit/plainedit.sh --path $(pwd) $@
fi