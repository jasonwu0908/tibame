# 輸入一正整數，找出所有小於或等於的質數。
number = eval(input("輸入一正整數，找出所有小於或等於的質數:"))
switch = 1
print(number,"中有的質數:",end=' ')
for num in range(2, number + 1):
    switch = 1
    for i in range(2, num):
        if (i > 0) and (num % i == 0):
            switch = 0
    if (switch == 1):
        print(num,end=' ')



