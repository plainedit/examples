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

    cat "$dirpath/html/head.html" > index.html

    if [[ "$SECOND" == "" ]]; then
        ./plainedit/plainedit.sh --path "$dirpath" $FIRST
        pandoc -f markdown "$dirpath/$FIRST/out.md" >> index.html
    else
        ./plainedit/plainedit.sh --path $dirpath $FIRST $SECOND
        pandoc -f markdown "$dirpath/$SECOND" >> index.html
    fi

    cat "$dirpath/html/foot.html" >> index.html

    firefox index.html
else
    echo "FIRST_EMPTY" > $LOGS
    ./plainedit/plainedit.sh --path $(pwd) $@
fi