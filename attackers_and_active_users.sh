#!/usr/bin/bash

echo -e  "\nList of Failed Connections:"
echo -e
tail -n 50  /var/log/auth.log | grep Failed | awk -F'invalid' '{print $2}'| sed '/^$/d' 
echo -e

echo -e "------------------------------------------------------------------\n"
echo -e  "List of active users:\n"

who

echo -e
