#!/bin/bash

# Select only emails from the student records and save to student-emails.txt
awk '{print $1}' students-list_1023.txt > student-emails.txt
echo "Emails of students saved to student-emails.txt"

