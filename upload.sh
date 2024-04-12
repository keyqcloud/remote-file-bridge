#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <security-token> <file-to-upload>"
    exit 1
fi

SECURITY_TOKEN="$1"
FILE_TO_UPLOAD="$2"
ENDPOINT="https://api.remotefilebridge.com/prod/upload"

# Check if the file exists
if [ ! -f "$FILE_TO_UPLOAD" ]; then
    echo "Error: File $FILE_TO_UPLOAD does not exist."
    exit 1
fi

# Determine the MIME type of the file
MIME_TYPE=$(file --brief --mime-type "$FILE_TO_UPLOAD")

# Check for empty file MIME type
if [ "$MIME_TYPE" == "inode/x-empty" ]; then
    echo "Error: The file $FILE_TO_UPLOAD is empty and cannot be uploaded."
    exit 1
fi

# Extract the file name from the file path
FILE_NAME=$(basename "$FILE_TO_UPLOAD")

# Upload the file
curl -X POST "$ENDPOINT" \
     -H "Content-Type: $MIME_TYPE" \
     -H "security-token: $SECURITY_TOKEN" \
     -H "file-name: $FILE_NAME" \
     --data-binary "@$FILE_TO_UPLOAD"
