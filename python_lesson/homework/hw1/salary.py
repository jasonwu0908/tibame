# 輸入便利商店工讀生的工作時數，並計算其薪資。
# 60小時以內，時薪120元。
# 61~80小時，以時薪1.25倍計算。
# 81小時以上，以時薪1.5倍計算。
# 說明：薪資以累計方式計算。若工時為90小時，則薪資為60*120 + 20*120*1.25 + 10*120*1.5元。
work_time = eval(input("please give work_time:"))

rate_60 = 120
rate_80 = rate_60 * 1.25
rate_81up = rate_60 * 1.5
time_1 = work_time if (work_time <= 60) else 60
time_3 = (work_time - 80) if (work_time > 80) else 0

if 61 <= work_time <= 80:
    time_2 = work_time - 60
elif work_time <= 60:
    time_2 = 0
else:
    time_2 = 20

money_81up = int(time_3) * rate_81up
money_80   = time_2 * rate_80
money_60   = time_1 * rate_60

print('time_1 =', time_1, 'time_2 =', time_2, 'time_3 =', time_3)
print('薪資 = ',money_81up + money_80 + money_60)