#!/bin/bash

filename="/home/student/Downloads/furever/server.js"
search_text=""

while read line; do
    if [[ $line == *"let hash = crypto.createHash('md5').update(pwd).digest('hex');"* ]]; then
        echo "Gradecheck-04 is successful!"
        exit 0
    fi
done < "$filename"

echo "Gradecheck-04 failed, try again!"
exit 1
