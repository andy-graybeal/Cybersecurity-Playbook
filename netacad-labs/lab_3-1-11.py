# Python Lab 3.1.11
income = float(input("Enter your income: "))
if income < 85528:
    tax = income * 0.18 - 556.02
else:
    tax = 14839.02 + (income - 85528) * 0.32
if tax < 0:
    tax = 0.0
print("The tax is:", round(tax, 0), "thalers")  
