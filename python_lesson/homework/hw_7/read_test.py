list_data = []
list_all_data = []
with open('emp.txt', 'r', encoding='utf-8') as f:
    line_data = f.readline()[:-1]
    print(line_data)
    while line_data != '':
        list_data = tuple(line_data.split(','))
        # print(line_data.split(','))
        print(list_data)
        list_all_data.append(list_data)
        print(list_all_data)
        line_data = f.readline()[:-1]
    print(list_all_data)

