#!/usr/bin/bash

printf "\nList of Failed Connections:\n"

tail -n 50  /var/log/auth.log | grep Failed | awk -F'invalid' '{print $2}'

echo -e "------------------------------------------------------------------\n"
echo -e  "List of active users:\n"

who

echo -e
