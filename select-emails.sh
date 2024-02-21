#!/bin/bash

# File to read student records from
STUDENTS_FILE="students-list_1023.txt"

# Output file for emails
EMAILS_FILE="student-emails.txt"

# Extract emails and save to output file
cut -d':' -f1 "$STUDENTS_FILE" > "$EMAILS_FILE"

echo "Emails extracted and saved to $EMAILS_FILE."
