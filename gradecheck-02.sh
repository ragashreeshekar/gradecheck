#!/bin/bash
hostname="fureveranimalrescue.aia.local"
port="443"
http_response=$(curl -k --write-out %{http_code} --silent --output /dev/null https://$hostname:$port)

if [ $http_response -eq 200 ]; then
    echo "Gradecheck-2 Success!"
else
    echo "Gradecheck-2 Failed, try again!"
fi
