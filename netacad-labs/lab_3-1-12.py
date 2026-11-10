# Python Lab 3.1.12

year = int(input("Enter a year: "))
if year > 1582:
    if year % 4 == 0:
        if year % 100 == 0:
            if year % 400 == 0:
                print(year, "is a leap year.")
            else:
                print(year, "is not a leap year.")
        else:
            print(year, "is a leap year.")
    else:
        print(year, "is not a leap year.")
else:
    print(year, "year is not within the Gregorian calendar period.")

    