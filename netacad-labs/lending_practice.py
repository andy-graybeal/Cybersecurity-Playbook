# input what is my "name'"
# input how many "students" make sure it is an integer
# input how many "computers" make sure it is an integer

# are there enough computers for the students?
# use the persons "name" in the output



input_name = input("What is my name? ")
input_students = int(input("How many students? "))
input_computers = int(input("How many computers? "))

if int(input_computers) >= int(input_students):
    print(f"Yes, {input_name}, there are enough computers for the students.")

else:
    print(f"No, {input_name}, there are not enough computers for the students.")       

