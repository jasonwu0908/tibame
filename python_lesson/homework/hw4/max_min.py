# 事先將10個數字置於串列中，
# 分別找出10個數字中最大的值和最小的值。
# (勿使用現成的函數)
import random


def give_ten_numbers():
    list1 = []
    for i in range(10):
        list1.append(random.randint(0, 99))
    return list1


def find_biggest_number(list):
    lenth = len(list)
    max_num = 0
    for i in range(lenth):
        if (list[i] > max_num):
            max_num = list[i]
    return max_num


def find_smallest_number(list):
    lenth = len(list)
    min_num = list[0]
    for i in range(lenth):
        if (list[i] < min_num):
            min_num = list[i]
    return min_num


def main():
    list = give_ten_numbers()
    print(list)
    print("=================")
    max_num = find_biggest_number(list)
    print('max_num = ', max_num)
    min_num = find_smallest_number(list)
    print('min_num = ', min_num)


main()


