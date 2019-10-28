# 輸入地區和性別，經由亂數產生一個身份証字號。
import random
list_id_first = [['A', 10, '臺北市'], ['B', 11, '臺中市'], ['C', 12, '基隆市'], ['D', 13, '臺南市'], ['E', 14, '高雄市'],
                 ['F', 15, '新北市'], ['G', 16, '宜蘭縣'], ['H', 17, '桃園市'], ['I', 34, '嘉義市'], ['J', 18, '新竹縣'],
                 ['K', 19, '苗栗縣'], ['M', 21, '南投縣'], ['N', 22, '彰化縣'], ['O', 35, '新竹市'], ['P', 23, '雲林縣'],
                 ['Q', 24, '嘉義縣'], ['T', 27, '屏東縣'], ['U', 28, '花蓮縣'], ['V', 29, '臺東縣'], ['W', 32,'金門縣'],
                 ['X', 30, '澎湖縣'], ['Z', 33, '連江縣'], ['L', 20, '臺中縣'], ['R', 25, '臺南縣'], ['S', 26, '高雄縣'],
                 ['Y', 31, '陽明山管理局']]
list_sex = [['男', 1], ['女', 2]]
list_num_count = [1, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1]
# '南投縣', '女'


def find_first_str(area):
    for i in range(len(list_id_first)):
        if area in list_id_first[i][2]:
            str_area = list_id_first[i][0]
            num_area = list_id_first[i][1]
            return str_area, num_area


def find_second_num(sex):
    for i in range(len(list_sex)):
        if str(sex) in list_sex[i][0]:
            sex_num = list_sex[i][1]
            return sex_num


def produce_id_number(str_area, sex_num):
    list_id_try = [str_area, sex_num]
    # print(list_id_try)
    for i in range(len(list_id_try), 10):
        list_id_try.append(random.randint(0, 9))
    return list_id_try


def turn_to_checklist(list_id_try, num_area):
    list_count = list_id_try[1:]
    list_num_area = list(str(num_area))
    for i in range(1, -1, -1):
        list_count.insert(0, int(list_num_area[i]))
    return list_count


def check_id_final(list_count):
    total = 0
    for i in range(len(list_count)):
        total += list_count[i] * list_num_count[i]
    # print('total = ', total)
    if total % 10 == 0:
        return True
    else:
        return False


def main():
    list_count = [1]
    try:
        area, sex = eval(input("請輸入地區和性別:"))
        str_area, num_area = find_first_str(area)
        sex_num = find_second_num(sex)
    except:
        print('輸入錯誤')
        return main()
    while not check_id_final(list_count):
        list_id_try = produce_id_number(str_area, sex_num)
        list_count = turn_to_checklist(list_id_try, num_area)
    for i in range(1, len(list_id_try)):
        list_id_try[i] = str(list_id_try[i])
    str_final_id = "".join(list_id_try)
    print(str_final_id)


main()
