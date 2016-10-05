#!/bin/bash

cd $1

> $1/README_INDEX.md

FILES=$(find . -name 'README.md')

for f in $FILES
do
	MASTER=$1"/tree/master"
	TEMP=${f/\./$MASTER}
	REMOVE=$GOPATH\/src
	CLEAN=${TEMP/$REMOVE/"https:/"}
	CLEAN=${CLEAN/README.md/""}

	echo $CLEAN >> $1/README_INDEX.md
	echo "" >> $1/README_INDEX.md
done
