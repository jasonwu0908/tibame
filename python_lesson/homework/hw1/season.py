# 輸入月份1~12月，判斷相對應的季節春、夏、秋、冬並印出。若不在此範圍則印出”輸入錯誤”。
month = eval(input("please give month:"))
if (month not in range(1,13)):
    print('輸入錯誤')
elif (3 <= month <= 5):
    print('春')
elif (6 <= month <= 8):
    print('夏')
elif (9 <= month <= 11):
    print('秋')
else:
    print('冬')