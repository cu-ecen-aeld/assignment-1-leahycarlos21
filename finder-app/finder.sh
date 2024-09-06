#!/bin/bash


if [ "$#" -ne 2 ]; then
    echo "Error: missing parameter"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
    echo "Error: filesdir does not represent a directory on the filesystem"
    exit 1
fi

matchingString=$(find "$filesdir" -type f -exec grep -o "$searchstr" {} + | wc -l)
fileCount=$(find "$filesdir" -type f -exec grep -l "$searchstr" {} + | wc -l)

echo "The number of files are $fileCount and the number of matching lines are $matchingString"

exit 0

