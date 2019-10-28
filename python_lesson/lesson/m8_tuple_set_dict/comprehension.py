list1 = [i+3 for i in range(4)]
print(list1)

set1 = {i+3 for i in range(4)}
print(set1)

dict1 = {i: i*3 for i in range(1, 10)}
print(dict1)


tuple1 = (i+3 for i in range(4))
for val in tuple1:
    print(val)


list1 = [i for i in range(50) if i % 2]
print(list1)

list1 = [i for i in range(50) if not i % 2]
print(list1)



