#!/bin/bash
USER_ID=$(id -u)

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$USER_ID/bus"

export DISPLAY=:0

API_URL="https://the-personal-quotes.p.rapidapi.com/quotes/random"
API_Header="x-rapidapi-host: the-personal-quotes.p.rapidapi.com"
API_KEY="x-rapidapi-key: 33f058e19amsh95ab3ad4bbd9fa8p1138fcjsnb3523c1349fb"

# Fetch the quote data
response=$(curl --request GET \
	--url "$API_URL" \
	--header "$API_Header" \
	--header "$API_KEY")

# Check if the response is valid
if [ -z "$response" ]; then
    echo "Failed to fetch quote."
    exit 1
fi

# Extract the quote and author using jq
quote=$(echo "$response" | jq -r '.quote')
author=$(echo "$response" | jq -r '.author')

# Ensure the extracted data is valid
if [ -z "$quote" ] || [ -z "$author" ]; then
    echo "Failed to extract quote or author."
    exit 1
fi

message="\"$quote\" - $author"

# Get the current timestamp
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Append the message to the log file with timestamp
echo "[$timestamp] $message" >> /home/dev078/SURYA/PRVT/quotes_log.txt

# Check if notify-send is available and send the notification
if command -v notify-send &> /dev/null; then
    notify-send "Quote of the Day" "$message"
else
    echo "notify-send is not available. Here's your quote:"
    echo "$message"
fi



