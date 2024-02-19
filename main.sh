#!/bin/bash
# script to create a student record
 read -p 'Enter Email:' email
 read -p 'Enter student Age: age
 read -p 'Enter  student ID' student-id
 # script to save student record
 echo '$email,$age,$student-id' >>student-list_1023.txt
