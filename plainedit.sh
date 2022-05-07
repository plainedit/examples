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
if [[ "$1" != "" ]]; then
    echo "FIRST_NOT_EMPTY" > $LOGS
    FIRST=$1
    SECOND=$2
    full_path=$(realpath $0)
    dirpath=$(dirname $full_path)
    #dirpath=$(pwd)

    ## load all params: in out status
    if [[ "$1" == "--path" ]]; then
      dirpath=$2
      FIRST=$3
      SECOND=$4
    fi

    HTML_PATH="$dirpath/$FIRST/$HTML_FILE"

    cat "$dirpath/$HTML_FOLDER/head.html" > $HTML_PATH

    if [[ "$SECOND" == "" ]]; then
        ./plainedit/plainedit.sh --path "$dirpath" $FIRST
        pandoc -f markdown "$dirpath/$FIRST/out.md" >> $HTML_PATH
    else
        ./plainedit/plainedit.sh --path $dirpath $FIRST $SECOND
        pandoc -f markdown "$dirpath/$SECOND" >> $HTML_PATH
    fi

    cat "$dirpath/html/foot.html" >> $HTML_PATH

    firefox $HTML_PATH
else
    echo "FIRST_EMPTY" > $LOGS
    ./plainedit/plainedit.sh --path $(pwd) $@
fi