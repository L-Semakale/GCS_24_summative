#!/bin/bash

# File to store student records
STUDENTS_FILE="students-list_1023.txt"

# Function to create a student record
create_student() {
    echo "Enter student details:"
    read -p "Email: " email
    read -p "Age: " age
    read -p "Student ID: " student_id

# Check if student ID already exists
    if grep -q "^$student_id:" "$STUDENTS_FILE"; then
        echo "Student with ID $student_id already exists."
    else
        echo "$email:$age:$student_id" >> "$STUDENTS_FILE"
        echo "Student record created successfully."
    fi
}

# Function to delete a student by ID
delete_student() {
    read -p "Enter student ID to delete: " delete_id
    sed -i "/,$delete_id\$/d" $STUDENTS_FILE
    echo "Student with ID $delete_id deleted successfully."
}

# Function to update a student record by ID
update_student(){

 read -p"Please enter the student ID:" Student_ID
 if grep",$Student_ID$"students-list_1023.txt
 then
 echo"What is your updated student email?"
 read updated_email
 echo"What isyour new age?"
read new_age
 old_record=$(grep",$Student_ID$"$STUDENTS_FILE)
 sed -i"s/$old_record/$(echo $updated_email,$new_age,$Student_ID)/g"
 $STUDENTS_FILE
 else
 echo"The provided Student ID is not registered.Please try again"
 fi
}
#view all students
view_students (){
 if [-f $STUDENTS_FILE ]; then
 cat $STUDENTS_FILE
 else
 echo"Nostudents"
 fi
}


# Main menu
while true; do
    echo -e "\nMenu:"
    echo "1. Create Student Record"
    echo "2. Update Student Record"
    echo "3. Delete Student"
    echo "4. View All Students"

    echo "5. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) create_student ;;
        2) update_student ;;
        3) delete_student ;;
        4) view_students ;;
        5) exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
