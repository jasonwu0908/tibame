# a~d各小題皆以一函數來處理：為練習串列的參數傳遞，陣列需定義為main()的區域變數
# ，事先將12個數字置於一3 x 4的二維串列中，列印各函數的結果。
# a.	計算所有數字的平均值
# b.	找出12個數字中最大的值
# c.	找出12個數字中最小的值
# d.	計算每組內4個數字的平均值
list1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
row = len(list1)
col = len(list1[0])

def list_avg(list1):
    total = 0
    for i in range(row):
        for j in range(col):
            total += list1[i][j]
    avg = total / (row * col)
    return avg


def list_biggest(list1):
    max_num = 0
    for i in range(row):
        for j in range(col):
            if (list1[i][j] > max_num):
                max_num = list1[i][j]
    return max_num


def list_smallest(list1):
    min_num = list1[0][0]
    for i in range(row):
        for j in range(col):
            if (list1[i][j] < min_num):
                min_num = list1[i][j]
    return min_num


def list_row_avg(list1):
    total = 0
    row_avg_list = []
    for i in range(row):
        for j in range(col):
            total += list1[i][j]
        row_avg = total / col
        row_avg_list.append(row_avg)
    return row_avg_list


def main(list1):
    print('list1 = ', list1)
    print('list1_avg = ', list_avg(list1))
    print('list1_max = ', list_biggest(list1))
    print('list1_min = ', list_smallest(list1))
    print('list_row_avg = ', list_row_avg(list1))


main(list1)
