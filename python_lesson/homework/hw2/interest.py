# 錢精打以10%單利投資100000元，郝細算則以5%複利投資100000元。計算多少年後郝細算的投資可以超過錢精打，
# 並將此時兩人錢數印出。(27年後)
# 提示：單利公式：P(1+r*n)    複利公式：P(1+r)n
# P：本金，r：利率，n：多少年
import math as m
money = 100000
good = 100000
good_increase = 0.05
money_increase = 0.1
n = 1

while (good <= money):
    money = 100000
    good = 100000
    money = int(money * (1+(money_increase * n)))
    # print("money = ",money)
    good = int(good * ((1+good_increase)**n))
    # print("good = ",good)
    # print("n = ",n)
    n += 1
print((n -1), "年後\n", "money = ", money, "\n good = ", good)