import random

list1 = [123, 456, 875, 4984, 1564, 3516, 648, 48, 684]
print(list1[2:6])
print(list1[1:-6])
print(list1[:5])
list2 = []


for i in range(10):
    list2.append(random.randint(1, 100))
print(list2)

