# 寫一函數is_id (_id)用來判斷_id是否為正確身份証字號。
list_id_first = [['A', 10, '臺北市'], ['B', 11, '臺中市'], ['C', 12, '基隆市'], ['D', 13, '臺南市'], ['E', 14, '高雄市'],
                 ['F', 15, '新北市'], ['G', 16, '宜蘭縣'], ['H', 17, '桃園市'], ['I', 34, '嘉義市'], ['J', 18, '新竹縣'],
                 ['K', 19, '苗栗縣'], ['M', 21, '南投縣'], ['N', 22, '彰化縣'], ['O', 35, '新竹市'], ['P', 23, '雲林縣'],
                 ['Q', 24, '嘉義縣'], ['T', 27, '屏東縣'], ['U', 28, '花蓮縣'], ['V', 29, '臺東縣'], ['W', 32,'金門縣'],
                 ['X', 30, '澎湖縣'], ['Z', 33, '連江縣'], ['L', 20, '臺中縣'], ['R', 25, '臺南縣'], ['S', 26, '高雄縣'],
                 ['Y', 31, '陽明山管理局']]
list_sex = ['1', '2']
# list_num_count = [1, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1]
list_id = []


def turn_str_into_list(gived_id):
    list_id = []
    for i in range(len(gived_id)):
        list_id.append(gived_id[i])
    return list_id


def check_id_lenth(list_id):
    if len(list_id) != 10:
        print("輸入的字數不為10!")
        breakpoint(main())
    else:
        return list_id


def check_first_word(list_id):
    for i in range(len(list_id_first)):
        if list_id[0] in list_id_first[i][0]:
            return list_id
    print("第一個字有錯")
    breakpoint(main())


def check_second_word(list_id):
    if list_id[1] in list_sex:
        return list_id
    else:
        print("第2位不為1或2")
        breakpoint(main())


def check_number(list_id):
    try:
        for i in range(1, len(list_id)):
            list_id[i] = int(list_id[i])
        return list_id
    except ValueError:
        print("後9碼需皆為數字")
        breakpoint(main())


def check_str_num(list_id_new):
    for i in range(len(list_id_first)):
        if list_id_new[0] == list_id_first[i][0]:
            num = list_id_first[i][1]
            print('num = ', num)
            return num


def check_total_num(list_id_new, num):
    total = 0
    num = str(num)
    list_num = list(num)
    int(list_num[0])
    for i in range(len(list_id_new)-2, 0, -1):
        total += list_id_new[9 - i] * i
    total = total + int(list_num[0]) + int(list_num[1])*9 + list_id_new[9]
    return total


def main():
    while True:
        gived_id = str(input("請輸入身分證:"))
        list_id = (turn_str_into_list(gived_id))
        print(list_id)
        check_id_lenth(list_id)
        check_first_word(list_id)
        check_second_word(list_id)
        list_id_new = check_number(list_id)
        num = check_str_num(list_id_new)
        if check_total_num(list_id_new, num) % 10 == 0:
            print("correct!!!!!!!")
        else:
            print("輸入錯誤!")


main()
