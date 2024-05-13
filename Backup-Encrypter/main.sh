#!/bin/bash

cd /app

tar czf compressed.tar.gz ./encrypt

echo "6iVA-bAcT-b2ex-5IXI-W66j-mzFE-N9z6-NAW5" | gpg --batch --yes --passphrase-fd 0 --symmetric --cipher-algo AES256 -c compressed.tar.gz

# Set the time zone to UTC+2
export TZ=UTC+2

# Get the current date and time in the desired format
timestamp=$(date "+%Y-%m-%d-%H-%M-%S")

# Set the original filename
original_filename="compressed.tar.gz.gpg"

# Create the new filename by appending the timestamp
new_filename="${original_filename%.*}-${timestamp}.${original_filename##*.}"

# Rename the file
mv "$original_filename" "$new_filename"

mv "$new_filename" ./syncdir/Auto-Backup

rm compressed.tar.gz

cd ./syncdir/Auto-Backup

# Set the number of files to keep
NUM_FILES_TO_KEEP=8

# List all files in the directory except for the last 8 created
FILES_TO_DELETE=$(ls -t | tail -n +$((NUM_FILES_TO_KEEP + 1)))

# Delete the files
for FILE in $FILES_TO_DELETE
do
  rm $FILE
done
