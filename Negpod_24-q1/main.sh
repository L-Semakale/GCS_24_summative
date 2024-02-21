#!/bin/bash

# Function to validate email format
validate_email_format() {
    email="$1"
    # Regular expression to match the required email format
    regex='^[a-z]\.[a-zA-Z]+@alustudent\.com$'
    if [[ $email =~ $regex ]]; then
        return 0
    else
        return 1
    fi
}

# Function to create a student record
create_student() {
    attempts=0
    while [ $attempts -lt 3 ]; do
        echo "Enter student email:"
        read email
        
        if validate_email_format "$email"; then
            break
        else
            ((attempts++))
            echo "Invalid email format. Please follow the format: [first name initial][last name in full]@alustudent.com"
            if [ $attempts -eq 3 ]; then
                echo "Example: f.kabeya@alustudent.com"
            fi
        fi
    done
    
    if [ $attempts -lt 3 ]; then
        echo "Enter student age:"
        read age
        echo "Enter student ID:"
        read id
        
        # Check if the student record already exists
        if grep -q "$id" students-list_1023.txt; then
            echo "Student with ID $id already exists."
        else
            echo "$email $age $id" >> students-list_1023.txt
            echo "Student record created successfully."
        fi
    else
        echo "Failed to create student record. Exceeded maximum attempts for email format."
    fi
}

# Function to view all students
view_students() {
    if [ -s students-list_1023.txt ]; then
        cat students-list_1023.txt
    else
        echo "No students found."
    fi
}

# Function to delete a student record by ID
delete_student() {
    echo "Enter student ID to delete:"
    read id
    if grep -q "$id" students-list_1023.txt; then
        sed -i "/$id/d" students-list_1023.txt
        echo "Student with ID $id deleted successfully."
    else
        echo "Student with ID $id not found."
    fi
}

# Function to update a student record by ID
update_student() {
    echo "Enter student ID to update:"
    read id
    if grep -q "$id" students-list_1023.txt; then
        echo "Enter new student email:"
        read new_email
        if validate_email_format "$new_email"; then
            echo "Enter new student age:"
            read new_age
            sed -i "/$id/c\\$new_email $new_age $id" students-list_1023.txt
            echo "Student with ID $id updated successfully."
        else
            echo "Invalid email format. Please follow the format: [first name initial][last name in full]@alustudent.com"
        fi
    else
        echo "Student with ID $id not found."
    fi
}

# Main menu
while true; do
    echo "Welcome to ALU registration system"
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) create_student ;;
        2) view_students ;;
        3) delete_student ;;
        4) update_student ;;
        5) echo "Exiting..."; exit ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac
done

 
