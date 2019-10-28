list1 = [[1, 2, 3, 4], [5, 6, 7, 8]]
print(list1)
print(list1[0][0])
print(list1[1][2])

print(list1[0])
print(list1[1])

print("==============================")

for i in range(len(list1)):
    for j in range(len(list1[i])):
        print(list1[i][j])

print("==============================")

for i in range(len(list1)):
    print(list1[i][2], end=' ')


print("\n==============================")

for i in range(len(list1[0])):
    print(list1[0][i], end=' ')

print("\n==============================")

# list2 = [[[11, 32],[54, 25], [48, 63],
#           [[70, 20], [14, 61], [73, 19]]]]
#
#
# print("\n==============================")
import random

row, col = eval(input("give me row & col:"))

list3 = []
for i in range(row):
    list3.append([])
    for j in range(col):
        list3[i].append(random.randint(1, 99))
print(list3)


