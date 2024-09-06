#!/bin/bash


if [ "$#" -ne 2 ]; then
    echo "Error: missing parameter"
    exit 1
fi

writefile=$1
writestr=$2


dirpath=$(dirname "$writefile")

if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory"
        exit 1
    fi
fi

echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not write to file."
    exit 1
fi

exit 0
