#!/bin/bash
hostname="localhost"
port="3000"
http_response=$(curl --write-out %{http_code} --silent --output /dev/null http://$hostname:$port)

if [ $http_response -eq 200 ]; then
    echo "Gradecheck-01 Success!"
else
    echo "Gradecheck-01 Failed, try again!"
fi
