#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 08.05.2022

# EXAMPLE
# ./update_all_projects.sh

# START
./readme.sh
for FILE in */in.md; do
  NAME=${FILE%%/*}
  echo "$NAME"
  ./plainedit.sh $NAME
done

