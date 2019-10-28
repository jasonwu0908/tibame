# Amstrong數是指一個三位數的整數，其各位數之立方和等於該數本身。
# # 找出所有的Amstrong數。
# # 說明：153=13+53+33，故153為Amstrong數。
import math as m
for number in range(100,1000):
    string = str(number)
    str_100 = string[0]
    str_10 = string[1]
    str_1 = string[2]
    num_100 = int(str_100)
    num_10 = int(str_10)
    num_1 = int(str_1)

    if (number == (m.pow(num_100,3) + m.pow(num_10,3) + m.pow(num_1,3))):
        # print(m.pow(num_100, 3), m.pow(num_10, 3), m.pow(num_1, 3))
        print(number,'為Amstrong數')







