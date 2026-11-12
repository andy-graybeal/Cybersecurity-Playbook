# Python Lab 3.2.15
c0 = int(input("Enter the initial amount: "))
steps = 0

while c0 != 1:
    if c0 % 2 == 0:
        c0 = c0 // 2
    else:
        c0 = 3 * c0 + 1
    steps += 1
    print(c0)

print("The number of steps taken is:", steps)   