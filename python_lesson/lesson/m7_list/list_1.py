list1 = ['Python', 'C', 'Java']
print(list1[1])

for i in range(len(list1)):
    print(list1[i])


list2 = [52, 614, 64, 484, 9684, 684, 684]
total = 0
for i in range(len(list2)):
    total += list2[i]
print(total)
print(sum(list2))
print(max(list2))
print(min(list2))

print( 52 in list2)
list3 = list2 + list1
print(list3)
print(list1 * 3)




