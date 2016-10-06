#!/bin/bash

PROJECTPATH=$GOPATH/src/$1

cd $PROJECTPATH

> $PROJECTPATH/README_INDEX.md

FILES=$(find . -name 'README.md')

for f in $FILES
do

	BASE_DIRECTORY=$(echo "$f" | cut -d "/" -f2)

	if [ $BASE_DIRECTORY != "vendor" ]; then

		MASTER=$PROJECTPATH"/tree/master"
		TEMP=${f/\./$MASTER}
		REMOVE=$GOPATH\/src
		CLEAN=${TEMP/$REMOVE/"https:/"}
		CLEAN=${CLEAN/README.md/""}
		NAME=$(basename $CLEAN)
		PARENT=$(basename $(dirname $CLEAN))

		if [ $NAME != "master" ]; then

			echo \[$PARENT/$NAME\]\($CLEAN\) >> $PROJECTPATH/README_INDEX.md
			echo "" >> $PROJECTPATH/README_INDEX.md

		fi

	fi
done
