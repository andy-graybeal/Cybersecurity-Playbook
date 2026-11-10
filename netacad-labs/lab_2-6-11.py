# Python Lab 2.6.11

hour = int(input("Starting time (hours): "))
mins = int(input("Starting time (minutes): "))
dura = int(input("Event duration (minutes): "))


# Write your code here.

ending_hours = (hour + ((mins + dura) // 60)) % 24
ending_minutes = ((mins + dura) % 60)

# print("Total hours:", ending_hours)
# print("Leftover minutes:", ending_minutes)

# print("Ending time: %02d:%02d" % (ending_hours, ending_minutes))

print("Ending time: ", ending_hours, ":", ending_minutes ) 