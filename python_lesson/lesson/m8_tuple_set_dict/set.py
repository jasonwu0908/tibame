tuple1 = (1, 2, 3, 4, 5, 4, 3, 6)
set1 = set(tuple1)
print(tuple1)
print(set1)
set1.add(7)
print(set1)

print("=========================")

set1 = {1, 2, 3, 5, 8}
set2 = {1, 3, 5, 7, 9}

print(set1 | set2)
print(set1 & set2)
print(set1 - set2)
print(set2 - set1)
print(set1 ^ set2)


set3 = {1, 3, 5}
print(set3.issubset(set1))
print(set1.issuperset(set3))

print(set1 == set3)
