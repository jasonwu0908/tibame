# 利用for迴圏計算12-22+32-42+…+492-502的值。
import math as m
total = 0
for i in range(2,52,2):
    odd = m.pow((i-1), 2)
    even = m.pow(i, 2)
    total += (odd - even)
print(total)




