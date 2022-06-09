#!/bin/bash

# set variables
hostname='172.17.0.3'
#port=$1
port=5000

# wait for the app to start
sleep 5 

# ping the app
# status_code=$(curl --write-out %{http_code} --silent ${hostname}:${port})
status_code=$(curl -s -o /dev/null -w %{http_code} ${hostname}:${port})

if [ $status_code == 200 ];
then
	echo "PASS: ${hostname}:${port} is reachable"
else
	echo "FAIL: ${hostname}:${port} is unreachable"
    exit 1
fi
