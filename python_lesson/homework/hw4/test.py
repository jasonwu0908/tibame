# 某一公司有五種產品A、B、C、D與E，其單價分別為12、16、10、14與15元
# ；而該公司共有三位銷售員，他們在某月份的銷售數量如下所示

# 銷售員	產品A	產品B	產品C	產品D	產品E
# Jean	33	32	56	45	33
# Tom	77	33	68	45	23
# Tina	43	55	43	67	65

# 試計算：
# a.	每一個銷售員的銷售總金額
# b.	有最好業績（銷售總金額最多者）的銷售員
# c.	每一項產品的銷售總金額
# d.	銷售總金額最多的產品

list1 = [['銷售員', '產品A', '產品B', '產品C', '產品D', '產品E'],
         ['Jean', 33, 32, 56, 45, 33],
         ['Tom', 77, 33, 68, 45, 23],
         ['Tina', 43, 55, 43, 67, 65]]
list1_price = [12, 16, 10, 14, 15]
list1_name = ['Jean', 'Tom', 'Tina']
list1_name = ['產品A', '產品B', '產品C', '產品D', '產品E']
row = len(list1)
col = len(list1[0])


def sailer_sum(list1):
    sum_sailer_list = []
    for i in range(1, row):
        total = 0
        for j in range(1, col):
            list1_price[j - 1]
            total += list1[i][j] * list1_price[j - 1]
        sum_sailer_list.append(list1[i][0])
        sum_sailer_list.append(total)
    return sum_sailer_list


def find_max(list1):
    max_num = 0
    row = len(list1)
    for i in range(1, row, 2):
        if (list1[i] > max_num):
            max_num = list1[i]
    return max_num


def find_prod_price_sum(list1):
    max_num_list = []
    for i in range(1, col):
        total = 0
        for j in range(1, row):
            total += list1[j][i]
        max_num = total * list1_price[i - 1]
        # print('max_num = ', max_num)
        max_num_list.append(max_num)
    return max_num_list




def main():
    print(sailer_sum(list1))
    print(find_max(sailer_sum(list1)))
    list_pro_price_sum_list = find_prod_price_sum(list1)

    for j in range(len(list1_price)):
        print(list1_name[j], ":\t", list_pro_price_sum_list[j])

    print(find_max(find_prod_price_sum(list1)))


main()