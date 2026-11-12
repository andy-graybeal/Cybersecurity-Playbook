# Python lab 3.2.14


blocks = int(input("Enter the number of blocks: "))

height = 0
in_layer = 1

while in_layer <= blocks:
    blocks -= in_layer
    height += 1
    in_layer += 1
    

print("The height of the pyramid:", height)

