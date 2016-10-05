#!/bin/bash

PROJECTPATH=$GOPATH/src/$1

cd $PROJECTPATH

> $PROJECTPATH/README_INDEX.md

FILES=$(find . -name 'README.md')

for f in $FILES
do
	MASTER=$PROJECTPATH"/tree/master"
	TEMP=${f/\./$MASTER}
	REMOVE=$GOPATH\/src
	CLEAN=${TEMP/$REMOVE/"https:/"}
	CLEAN=${CLEAN/README.md/""}

	echo $CLEAN >> $PROJECTPATH/README_INDEX.md
	echo "" >> $PROJECTPATH/README_INDEX.md
done
