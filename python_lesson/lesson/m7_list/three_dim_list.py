list1 = [[[1, 2, 3], [5, 6, 7]],
         [[8, 9, 10], [11, 12, 13]]]
print(list1)
print(list1[0][0][0])
print(list1[1][1][0])

print(list1[0][0])
print(list1[1][0])

print(len(list1))
print(len(list1[0]))
print(len(list1[0][0]))

print("==============================")
total = 0
for i in range(len(list1)):
    for j in range(len(list1[i])):
        for k in range(len(list1[i][j])):
            # print(list1[i][j][k])
            total += list1[i][j][k]
print(total)


# print("==============================")
#
# for i in range(len(list1)):
#     print(list1[i][2], end=' ')


# print("\n==============================")
#
# for i in range(len(list1[0])):
#     print(list1[0][i], end=' ')
#
# print("\n==============================")
#
# # list2 = [[[11, 32],[54, 25], [48, 63],
# #           [[70, 20], [14, 61], [73, 19]]]]
# #
# #
print("\n==============================")


import random

row, col, kon = eval(input("give me row & col & kon:"))

list3 = []
for i in range(row):
    list3.append([])
    for j in range(col):
        list3[i].append([])
        for k in range(kon):
            list3[i][j].append(random.randint(1, 99))

print(list3)


