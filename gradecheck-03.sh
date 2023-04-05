#!/bin/bash

filename="/home/student/Documents/furever/server.js"
search_text=""

while read line; do
    if [[ $line == *"let hash = crypto.createHash('sha256').update(pwd).digest('hex');"* ]]; then
        echo "Gradecheck-03 is successful!"
        exit 0
    fi
done < "$filename"

echo "Gradecheck-03 failed, try again!"
exit 1
