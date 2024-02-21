 #!/bin/bash
 while true
 do
 echo"options:
 1.Registeration
 2.View all students
 3.Delete a record
 4.Update a record
 5.Exit application
 (Choose an option between 1-5)"
 read option
 if(($option==1))
 then
 echo"What is your student email?"
 read email
 echo"How old are you?"
 read age 
 echo"What is your student ID?"
 read ID
 if [-f students-list_1023.txt ]; then
 echo$email,$age,$ID>>students-list_1023.txt
 else
 echo $email,$age,$ID>students-list_1023.txt
 fi
 elif(($option==2))
 then
 if [-f students-list_1023.txt ]; then
 cat students-list_1023.txt
 else
 echo"No students"
 fi
 elif(($option==3))
 then
 echo"Enter the ID to delete"
 read ID
 sed-i"/,$ID\$/d"students-list_1023.txt
 elif(($option==4))
 then
 echo"Please enter the student ID"
 read Student_ID
 if grep",$Student_ID$"students-list_1023.txt
 then
 echo"What is your updated student email?"
 read updated_email
 echo"What is your new age?"
read new_age
 old_record=$(grep",$Student_ID$"students-list_1023.txt)
 sed-i"s/$old_record/$(echo$updated_email,$new_age,$Student_ID)/g"
 students-list_1023.txt
 else
 echo"The provided Student ID is not registered.Please try again"
 fi
 elif(($option==5))
 then
 exit 1
 fi
 done
 
