#!/usr/bin/bash

#Prompt the user for input

read -p "Enter your mail : " sender
read -s -p "Enter your mail Password : " pass
echo
read -p  "Enter recipient mail : " destination
read -p  "Subject : " sub



#Read the body of the email

echo " Enter the body of mail (Ctrl + D to end and sent) : "
body=$(</dev/stdin)


# Sending email using curl

response=$(curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
--mail-from "$sender" \
--mail-rcpt "$destination" \
--user "$sender: $pass" \
-T <(echo -e "From: $sender\nTo: $destination\nSubject: $sub\n\n $body"))

if [ $? -eq 0 ]
then
	echo " Email sent successfuly"
else
	echo "Failed to Sent"
	echo "Response : $response"
fi
